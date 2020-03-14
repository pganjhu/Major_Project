function [letter]=KannadaAlphabet(vd)
Vowels ={'a','aa','i','I','u','U','Ru','e','E','ai','o','O','ou','aM','aH'};
Consonants={'ka','kha','ga','gha','nga','ca','cha','ja','jha','nja','Ta','Tha','da','dha','Na','ta','tha'...
    'Da','Dha','na','pa','pha','ba','bha','ma','ya','ra','la','va','sha','Sha','sa','ha','La'};
%numbers={'sonne','ondu','eradu','muru','nalku','aydu','aru','elu','entu','ombattu'}
%KannadaAlphabets=[Vowels Consonants numbers];
KannadaAlphabets=[Vowels Consonants];

Len=length(KannadaAlphabets)
letter=KannadaAlphabets{vd};