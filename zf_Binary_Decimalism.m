function [value] = zf_Binary_Decimalism(bin2_8)
% % ����˵����������������ת����ʮ��������
% % �����bin2_8�����������飩
% % ���룺value��ʮ����������
value = 0;
len = length(bin2_8);
num_len=len-1;
if bin2_8(8)==0   %0������ʽ
    for i=1:num_len
        value= value + bin2_8(i)*(2^(num_len-i));
    end
else
    for i=1:num_len
        value= value + bin2_8(i)*(2^(num_len-i));
    end
    value=-value;   
end

% for i=1:num_len
%     value = value + bin2_8(i)*(2^(num_len-i));
% end
% if bin2_8(len)==1
%      value = -value;
% end

end