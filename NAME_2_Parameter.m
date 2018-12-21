function Parameters = NAME_2_Parameter( Name_str,Regs )
%NAME_2_P_INT Summary of this function goes here
%   Detailed explanation goes here

expression = Regs;
[startIndex,endIndex] = regexp(Name_str,expression);
str_parameter=Name_str(startIndex+1:endIndex-2);
Parameters=str2num(str_parameter);
end

