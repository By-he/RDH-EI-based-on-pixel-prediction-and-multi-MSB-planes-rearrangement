function [bin2_8] = zf_Decimalism_Binary(value)
% ����˵������ʮ����Ԥ��ֵת����8λ���������飨���룩,
% ���룺value��ʮ����Ԥ��ֵ��
% �����bin2_8��8λ���������飩
% ������������λ�Ƿ���λ��������λ����ֵλ����λ���127������������λΪ1����������λΪ0
if value>0
   bin2_8 = dec2bin(value)-'0';
   if length(bin2_8) < 8
      len = length(bin2_8);
      B = bin2_8;
      bin2_8 = zeros(1,8); %��������λΪ0
      for i=1:len
        bin2_8(7-len+i) = B(i); %����8λǰ�油��0
      end 
   end
else
   value = -value;
   bin2_8 = dec2bin(value)-'0';
   if length(bin2_8) < 8
      len = length(bin2_8);
      B = bin2_8;
      bin2_8 = zeros(1,8);
      bin2_8(8)=1;           %��������λΪ1
      for i=1:len
        bin2_8(7-len+i) = B(i); %����8λǰ�油��0
      end 
   end    
end

end
