function [ NAME] = FILE_IN_FOLDER( DIR_str,Reg )
%FILE_IN_FOLDER Summary of this function goes here
%   Detailed explanation goes here
listing=dir(DIR_str);
Filenames={listing.name};
NAME= Filenames(~cellfun('isempty',regexp(Filenames,Reg)));

end

