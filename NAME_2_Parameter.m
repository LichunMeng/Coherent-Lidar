function Parameters = NAME_2_Parameter( Name_str,Regs,START,END )
%NAME_2_P_INT Summary of this function goes here
%   Detailed explanation goes here

expression = Regs;
[startIndex,endIndex] = regexp(Name_str,expression);
str_parameter=Name_str(startIndex+START:endIndex-END);
Parameters=str2num(str_parameter);
end

