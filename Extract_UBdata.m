function [exUB_Data,exUB_numData] = Extract_UBdata(tag_preprocess,num_emubD,final_emUBdata,block_size,final_Stego1,final_Stego2,final_Stego3,final_Stego4,final_Stego5,final_Stego6,final_Stego7,final_Stego8)
%�������룺tag_preprocess(λƽ���Ƕ���),num_emubD(UB��Ƕ��DATA����),final_emUBdata(UB��Ƕ����Ϣ�Ŀ�ʼ����),block_size,
%���������exUB_Data(UB����ȡ������),exUB_numData(UB����ȡ��������)
%����������
if tag_preprocess(1)==1
%    num_extract1=ex_end_UB_t1;
   finalem_UBx1=final_emUBdata(1,1);
   finalem_UBy1=final_emUBdata(1,2);
   % fnub=f(1);
   [exUBD1,ex_end_UB_t1] = extract(final_Stego1,num_emubD,finalem_UBx1,finalem_UBy1,block_size);
else
    exUBD1=0;
    ex_end_UB_t1=0; %��һ��ȡ����DATAͣ������ֹ����
end
if tag_preprocess(2)==1
%    num_extract2=ex_end_UB_t1; %�ϸ�λƽ����ȡ��DATA��ֹ����
   finalem_UBx2=final_emUBdata(2,1);
   finalem_UBy2=final_emUBdata(2,2);
   % fnub=f(1);
   [exUBD2,ex_end_UB_t2] = extract(final_Stego2,num_emubD,finalem_UBx2,finalem_UBy2,block_size); 
else
    exUBD2=0;
    ex_end_UB_t2=0; %�ڶ�����ȡ���ݺ�dataͣ������ֹ����
end
if tag_preprocess(3)==1
%    num_extract3=ex_end_UB_t2; %�ϸ�λƽ����ȡ��DATA��ֹ����
   finalem_UBx3=final_emUBdata(3,1);
   finalem_UBy3=final_emUBdata(3,2);
   [exUBD3,ex_end_UB_t3] = extract(final_Stego3,num_emubD,finalem_UBx3,finalem_UBy3,block_size); 
else
    exUBD3=0;
    ex_end_UB_t3=0;
end
if tag_preprocess(4)==1
%    num_extract4=ex_end_UB_t3; %�ϸ�λƽ����ȡ��DATA��ֹ����
   finalem_UBx4=final_emUBdata(4,1);
   finalem_UBy4=final_emUBdata(4,2);
   [exUBD4,ex_end_UB_t4] = extract(final_Stego4,num_emubD,finalem_UBx4,finalem_UBy4,block_size); 
else
    exUBD4=0;
    ex_end_UB_t4=0;
end
if tag_preprocess(5)==1
%    num_extract5=ex_end_UB_t4; %�ϸ�λƽ����ȡ��DATA��ֹ����
   finalem_UBx5=final_emUBdata(5,1);
   finalem_UBy5=final_emUBdata(5,2);
   [exUBD5,ex_end_UB_t5] = extract(final_Stego5,num_emubD,finalem_UBx5,finalem_UBy5,block_size); 
else
    exUBD5=0;
    ex_end_UB_t5=0;
end
if tag_preprocess(6)==1
%    num_extract6=ex_end_UB_t5; %�ϸ�λƽ����ȡ��DATA��ֹ����
   finalem_UBx6=final_emUBdata(6,1);
   finalem_UBy6=final_emUBdata(6,2);
   [exUBD6,ex_end_UB_t6] = extract(final_Stego6,num_emubD,finalem_UBx6,finalem_UBy6,block_size); 
else
    exUBD6=0;
    ex_end_UB_t6=0;
end
if tag_preprocess(7)==1
%    num_extract7=ex_end_UB_t6; %�ϸ�λƽ����ȡ��DATA��ֹ����
   finalem_UBx7=final_emUBdata(7,1);
   finalem_UBy7=final_emUBdata(7,2);
   [exUBD7,ex_end_UB_t7] = extract(final_Stego7,num_emubD,finalem_UBx7,finalem_UBy7,block_size); 
else
    exUBD7=0;
    ex_end_UB_t7=0;
end
if tag_preprocess(8)==1
   finalem_UBx8=final_emUBdata(8,1);
   finalem_UBy8=final_emUBdata(8,2);
   [exUBD8,ex_end_UB_t8] = extract(final_Stego8,num_emubD,finalem_UBx8,finalem_UBy8,block_size); 
else
    exUBD8=0;
    ex_end_UB_t8=0;
end
exUB_numData=ex_end_UB_t1++ex_end_UB_t2+ex_end_UB_t3+ex_end_UB_t4+ex_end_UB_t5+ex_end_UB_t6+ex_end_UB_t7+ex_end_UB_t8;

exUBD1=exUBD1(1:ex_end_UB_t1);exUBD2=exUBD2(1:ex_end_UB_t2);exUBD3=exUBD3(1:ex_end_UB_t3);exUBD4=exUBD4(1:ex_end_UB_t4);
exUBD5=exUBD5(1:ex_end_UB_t5);exUBD6=exUBD6(1:ex_end_UB_t6);exUBD7=exUBD7(1:ex_end_UB_t7);exUBD8=exUBD8(1:ex_end_UB_t8);
m=0;
for i=1:8
    if tag_preprocess(i)==1
        m=m+1;
    end %ͳ�ƿ���Ƕ��λƽ��ĸ���       
end
if m==1 %��������ȡ���ݵ�λƽ�棬��ȡ�����ݺϲ�
    exUB_Data=exUBD1;
elseif m==2
    exUB_Data=[exUBD1,exUBD2];
elseif m==3
    exUB_Data=[exUBD1,exUBD2,exUBD3];
elseif m==4
    exUB_Data=[exUBD1,exUBD2,exUBD3,exUBD4];
elseif m==5
    exUB_Data=[exUBD1,exUBD2,exUBD3,exUBD4,exUBD5];
elseif m==6
    exUB_Data=[exUBD1,exUBD2,exUBD3,exUBD4,exUBD5,exUBD6];
elseif m==7
    exUB_Data=[exUBD1,exUBD2,exUBD3,exUBD4,exUBD5,exUBD6,exUBD7];
else
    exUB_Data=[exUBD1,exUBD2,exUBD3,exUBD4,exUBD5,exUBD6,exUBD7,exUBD8];
end


end

function [exUBD,exUB_t] = extract(final_Stego1,num_emubD,finalem_UBx,finalem_UBy,block_size)
[row,col] = size(final_Stego1); %ͳ��ͼ���������
block_m = floor(row/block_size);  %�ֿ��СΪblock_size*block_size
block_n = floor(col/block_size);  %�ֿ����Ϊblock_m*block_n��������block_m�зֿ飬block_n�зֿ�
% ftypeI = ceil(block_m*block_n/(block_size*block_size-1)); %Ƕ��typeI��UB����

exUBD = ones(1,num_emubD)*Inf; %����ȫ��һά���飬���ȵ���UBǶ�����ݳ���
exUB_t = 0; %��¼ÿ��λƽ����ȡ�������ݸ�����

startUB_x = finalem_UBx; %��UB����ȡ���ݵĿ�ʼ����
startUB_y = finalem_UBy;
%% ��UB����ȡ����
for t=1:num_emubD 
       for p=0:block_size-1
          for q=0:block_size-1
             if p==block_size-1 && q==block_size-1
                 break;
             else
                 exUB_t = exUB_t+1;
                 vx = startUB_x + p;
                 vy = startUB_y + q;
                 exUBD(exUB_t)= final_Stego1(vx,vy);
             end
          end
       end
       if vy==block_n*block_size-1 && mod(vx,block_size)==0 && vx~=block_m*block_size %��Ƕ�뵽ÿ�еĵ����ڶ��У���ΪԤ�����ز�Ƕ�룩,�Ҳ������һ��
          startUB_x = vx + 1; %������һ��
          startUB_y = 1;
       else
          startUB_y = vy + 2;
       end
       if vy==block_n*block_size-1 && vx==block_m*block_size
           break;
       end
end 
end

