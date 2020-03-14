% Validate.m
%   This script applies a pre-trained HOG detector to a sample validation 
%   image, reports the detector accuracy, and displays the image with true 
%   positives drawn.

addpath('./common/');
addpath('./graphics/');
addpath('./search/');

% Load the pre-configured and pre-trained HOG detector.
load('hog_model.mat');

% Set the threshhold for recognition. The SVM is trained to output
% -1 for non-persons and +1 for persons, so 0 would be the natural
% threshold. However, the detector is highly susceptible to false
% positives, so I'm using a higher threshold value here.
hog.threshold = 0.4;

% Read in the image to be searched.
% img = imread('./Images/Validation/Kannada_Text_4.png');  %IMG_0003.jpg');
 img =imresize(img(:,:,1),[256 256]);
% figure(10),imshow(img),title('Original Input')
tic();
figure(11)
% Search the image for persons.
resultRects = searchImage(hog, img);

elapsed = toc();
fprintf('Image search took %.2f seconds\n', elapsed);

%%
% Validate the search results.

% Load the annotations file.
goodRects = load('./Images/Validation/IMG_0003_annotations.csv');
goodRects =goodRects/16;
% Column 5 indicates whether the annotated rectangle is required or 
% optional.	Person who are in full view are required, persons who are
% significantly occluded are optional.
requiredIndeces = (goodRects(:, 5) == 1);
optionalIndeces = (goodRects(:, 5) == 0);
			
% Re-arrange the rectangles so that the required rectangles are checked first.
goodRects = [goodRects(requiredIndeces, :); goodRects(optionalIndeces, :)];

% The number of fully visible people, which we definitely want our detector
% to find.
numVisiblePeople = sum(requiredIndeces);

% Track whether each of the 'required' rectangles is found.
rectsFound = zeros(numVisiblePeople, 1);

numFalsePositives = 0;
		
% Add a column of zeros to the results to store whether it was a true
% positive (1), a false positive (0), or an optional positive (-1)
resultRects = [resultRects, zeros(size(resultRects, 1), 1)];

% For each of the results, validate it.
for k = 1 : size(resultRects, 1)

    % Check if the result rectangle overlaps any of the good rectangles.
    % It will check the 'required' rectangles first because we sorted the rectangles.
    indeces = checkRectOverlap(resultRects(k, :), goodRects, 0.5);
     
    % If we didn't find a match...
    if (isempty(indeces))
        % Indicate it's a bad result.
        resultRects(k, end) = 0;

        % Increment the number of false positives.
        numFalsePositives = numFalsePositives + 1;
    % If we found one or more matches...
    else
        % For each of the matches...
        for i = 1 : length(indeces)
            % If we found a 'required' match...
            if (goodRects(indeces(i), 5) == 1)
                % Indicate it's a good result.
                resultRects(k, end) = 1;

                % Indicate we found this person.
                rectsFound(indeces(i)) = 1;
            else
                % Indicate it's an optional result.
                resultRects(k, end) = -1;
            end
        end
    end

end

