function [Recover_I,Prediction_I] = Recover_image2(judge_predict,recover_bitplane1,recover_bitplane2,recover_bitplane3,recover_bitplane4,recover_bitplane5,recover_bitplane6,recover_bitplane7,recover_bitplane8)
%�������룺judge_predict����Щ��������λ��ʾ����Щ�ǰ�λ��
%   �˴���ʾ��ϸ˵��
 [row,col] = size(recover_bitplane1); 
 %% �õ�Ԥ�����ͼ��
 Prediction_I = ones(row,col)*Inf;
 bin2 = ones(1,8)*Inf;
 i=1;
 for j=1:col
    bin2(1)= recover_bitplane1(i,j);bin2(2)= recover_bitplane2(i,j);bin2(3)= recover_bitplane3(i,j);bin2(4)= recover_bitplane4(i,j);
    bin2(5)= recover_bitplane5(i,j);bin2(6)= recover_bitplane6(i,j);bin2(7)= recover_bitplane7(i,j);bin2(8)= recover_bitplane8(i,j);
    Prediction_I(i,j) = Binary_Decimalism(bin2); %�ο����ز��ó����ʮ���ƻ���λ�����Ƶķ���       
 end
 j=1;
 for i=2:row
    bin2(1)= recover_bitplane1(i,j);bin2(2)= recover_bitplane2(i,j);bin2(3)= recover_bitplane3(i,j);bin2(4)= recover_bitplane4(i,j);
    bin2(5)= recover_bitplane5(i,j);bin2(6)= recover_bitplane6(i,j);bin2(7)= recover_bitplane7(i,j);bin2(8)= recover_bitplane8(i,j);
    Prediction_I(i,j) = Binary_Decimalism(bin2); %�ο����ز��ó����ʮ���ƻ���λ�����Ƶķ���      
 end
 for i=2:row
    for j=2:col
       if judge_predict(i,j)==0
          bin2(1)= recover_bitplane1(i,j);bin2(2)= recover_bitplane2(i,j);bin2(3)= recover_bitplane3(i,j);bin2(4)= recover_bitplane4(i,j);
          bin2(5)= recover_bitplane5(i,j);bin2(6)= recover_bitplane6(i,j);bin2(7)= recover_bitplane7(i,j);bin2(8)= recover_bitplane8(i,j);
          Prediction_I(i,j) = zf_Binary_Decimalism(bin2); %�ο����ز��ó����ʮ���ƻ���λ�����Ƶķ���  
       else
          bin2(1)= recover_bitplane1(i,j);bin2(2)= recover_bitplane2(i,j);bin2(3)= recover_bitplane3(i,j);bin2(4)= recover_bitplane4(i,j);
          bin2(5)= recover_bitplane5(i,j);bin2(6)= recover_bitplane6(i,j);bin2(7)= recover_bitplane7(i,j);bin2(8)= recover_bitplane8(i,j);
          Prediction_I(i,j) = Binary_Decimalism(bin2); %�ο����ز��ó����ʮ���ƻ���λ�����Ƶķ���          
       end
    end
 end
 %% �õ�ԭʼͼ��
 Recover_I = Prediction_I;
 for i=2:row
     for j=2:col
         a = Recover_I(i-1,j);
         b = Recover_I(i-1,j-1);
         c = Recover_I(i,j-1);
         if judge_predict(i,j)==0
            if b <= min(a,c)
               Recover_I(i,j) = Recover_I(i,j) + max(a,c);
            elseif b>= max(a,c)
               Recover_I(i,j) = Recover_I(i,j) + min(a,c);  
            else
               Recover_I(i,j) = Recover_I(i,j) + (a+c-b);  
            end
         end
     end
 end
 
end %�����˸�λƽ��

