function x = Bayes(a,b,c,d)

%
% The Bayes' equation is:
%
%                       p(Y|X)p(X)               p(XY)
%       p(X|Y) = ------------------------- = --------------
%                p(Y|X)p(X) + p(Y|~X)p(~X)   p(XY) + p(~XY)
%
% Here, the sign ~ means complement [event(s)].
%
% The total probabilities schema is:
%
%                    X                     ~X
%          ----------------------------------------------
%      Y  |  p(XY)= p(Y|X)p(X)     p(~XY)= p(Y|~X)p(~X)  | p(Y)
%         |                                              |
%     ~Y  |  p(X~Y)= p(~Y|X)p(X)   p(~X~Y)= p(~Y|~X)p(~X)| p(~Y)
%          ----------------------------------------------                                         
%                   p(X)                  p(~X)
% 
% Note.-According to Eliezer S. Yudkowsky's web page [http://yudkowsky.net/
% rational/bayes], one thing that's confusing is about the '|' notation.
% Reading from left to right, '|' means 'given'; reading from right to left,
% '|' means 'implies' or 'leads to'.  Thus, moving your eyes from left to 
% right, X|Y reads 'X given Y' or 'the probability that an element is X, 
% given that the element is Y'.  Moving your eyes from right to left, X|Y
% reads 'Y implies X or 'the probability that an element containing Y is 
% X'.
%
% Syntax: function x = Bayes(a,b,c,d) 
%      
% Inputs:
% a - a priori probability (prior, marginal or actual)  
% b - First conditional probability, p(Y|X) [option=1]; first interaction
%     probability, p(XY) (true positive) [opion=2] or conditional 
%     probability, p(Y|X) [option=3]
% c - Second conditional probability, p(Y|~X) [option=1]; second interaction
%     probability, p(X~Y) (false positive) [opion=2] or interecation
%     probability, p(~XY) [option=3]
% d - Option = 1(default),2,or 3
% - It shows a dialog whether or not you are interested with the frequency
%   visualization of a given sample
%
% Output:
% x - chance positive test or positive result (posterior probability) 
% - frequency visualization of a given sample (optional)
%

if nargin < 4
    d == 1; %default
end

P = a; %a priori (prior or marginal) probability [actual]
disp(' ');
if d == 1
    disp('You should have given the two conditional probabilities p(Y|X) and p(Y|~X).');
    disp('Where, ~Y is the complement event of Y.');
    M = b; %First conditional probability, p(Y|X) 
    N = c; %Second conditional probability, p(Y|~X) 
    %The interaction probabilities are:
    A = P*M; %p(XY) [true positive]
    B = (1-P)*N; %p(~XY)[false positive]
    C = P*(1-M); %p(X~Y) [false negative]
    D = (1-P)*(1-N); %p(~X~Y) [true negative]
elseif d == 2
    disp('You should have given the two interaction probabilities p(XY) and p(~XY).');
    disp('Where, ~Y is the complement event of Y.');
    A = b; %First interaction probability, p(XY) [true positive]
    B = c; %Second interaction probability, p(X~Y) [false positive]
    Ac = 1-P; %p(~X)
    C = P-A; %false positive
    D = Ac-B; %true positive
else d == 3
    disp('You should have given, in this strictly order, one conditional probability [p(Y|X)] and');
    disp('one interecation probability [p(~XY)].');
    disp('Where, ~Y is the complement event of Y.');
    M = b; %Conditional probability, p(Y|X)
    A = P*M; %First interaction probability, p(XY)
    B = c; %Second interaction probability, p(~XY)
    Ac = 1-P; %p(~X)
    C = P-A; %false positive
    D = Ac-B; %true positive
end

x = A/(A+B); %chance positive test or positive result (posterior probability)

disp(' ');
i =  'n'; %input('Do you want a frequency visualization of a sample? (y/n): ','s');
if i == 'y'
    n = input('Give me the sample size: ');
    nX = a*n;
    nXc = n-nX;
    XY = A*n;
    XYc = C*n;
    XcY = B*n;
    XcYc = D*n;
    disp(' ');
    fprintf('Sample size = %2i\n', n);
    fprintf('X = %2i\n', nX);
    fprintf('~X = %2i\n', nXc);
    fprintf('XY = %2i\n', XY);
    fprintf('X~Y = %2i\n', XYc);
    fprintf('~XY = %2i\n', XcY);
    fprintf('~X~Y = %2i\n', XcYc);
else
end

x = A/(A+B); %chance positive test or positive result (posterior probability)

return,