function [tag_NUB] = NUBjudge(Process_bitplane1,block_size,fnub)
% �������룺Process_bitplane1������ͼ������Ƕtypeimage��
%   �˴���ʾ��ϸ˵��
  [row,col] = size(Process_bitplane1); %ͳ��ͼ���������
  block_m = floor(row/block_size);  %�ֿ��СΪblock_size*block_size
  block_n = floor(col/block_size);  %�ֿ����Ϊblock_m*block_n��ÿ����block_m���ֿ�
  tag_NUB=ones(1,fnub)*Inf;
%   startx1 = 5;
%   starty1 = 139;
%   startx2 = 6;
%   starty2 = 137;
%   startx3 = 7;
%   starty3 = 140;
%   startx4 = 8;
%   starty4 = 138;
   startx1 = 1;
   starty1 = 3;
   startx2 = 2;
   starty2 = 1;
   startx3 = 3;
   starty3 = 4;
   startx4 = 4;
   starty4 = 2;
for i=1:fnub
%       if mod(i,block_n)==1  %��������ÿ�е�һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
%         startx1 = startx1+block_size*(mod(i,block_n)-1);
%         starty1 = 3;
%         startx2 = startx2+block_size*(mod(i,block_n)-1);
%         starty2 = 1;
%         startx3 = startx3+block_size*(mod(i,block_n)-1);
%         starty3 = 4;
%         startx4 = startx4+block_size*(mod(i,block_n)-1);
%         starty4 = 2;
%      else %�����겻�䣬������ı�
%        starty1 = starty1+block_size;
%        starty2 = starty2+block_size;
%        starty3 = starty3+block_size;
%        starty4 = starty4+block_size;      
%      end
     if ( Process_bitplane1(startx1,starty1-1)+Process_bitplane1(startx1+1,starty1)+Process_bitplane1(startx1,starty1+1)==0 || Process_bitplane1(startx1,starty1-1)+Process_bitplane1(startx1+1,starty1)+Process_bitplane1(startx1,starty1+1)==1)&&Process_bitplane1(startx1,starty1)==0 
        tag_NUB(i)=0; 
     elseif ( Process_bitplane1(startx1,starty1-1)+Process_bitplane1(startx1+1,starty1)+Process_bitplane1(startx1,starty1+1)==2 || Process_bitplane1(startx1,starty1-1)+Process_bitplane1(startx1+1,starty1)+Process_bitplane1(startx1,starty1+1)==3)&&Process_bitplane1(startx1,starty1)==1 
        tag_NUB(i)=0;
     else
        tag_NUB(i)=1; 
        %break;
     end
     if tag_NUB(i)==0 %��һ�����ؿɻָ����ż������ڶ�������
       if (Process_bitplane1(startx2-1,starty2)+Process_bitplane1(startx2,starty2+1)+Process_bitplane1(startx2+1,starty2)==0 || Process_bitplane1(startx2-1,starty2)+Process_bitplane1(startx2,starty2+1)+Process_bitplane1(startx2+1,starty2)==1)&& Process_bitplane1(startx2,starty2)==0 
          tag_NUB(i)=0;
       elseif (Process_bitplane1(startx2-1,starty2)+Process_bitplane1(startx2,starty2+1)+Process_bitplane1(startx2+1,starty2)==2 || Process_bitplane1(startx2-1,starty2)+Process_bitplane1(startx2,starty2+1)+Process_bitplane1(startx2+1,starty2)==3)&& Process_bitplane1(startx2,starty2)==1 
          tag_NUB(i)=0; 
       else
          tag_NUB(i)=1;          
       end
     end
     if tag_NUB(i)==0
        if (Process_bitplane1(startx3,starty3-1)+Process_bitplane1(startx3-1,starty3)+Process_bitplane1(startx3+1,starty3)==0 || Process_bitplane1(startx3,starty3-1)+Process_bitplane1(startx3-1,starty3)+Process_bitplane1(startx3+1,starty3)==1)&& Process_bitplane1(startx3,starty3)==0 
           tag_NUB(i)=0;
        elseif (Process_bitplane1(startx3,starty3-1)+Process_bitplane1(startx3-1,starty3)+Process_bitplane1(startx3+1,starty3)==2 || Process_bitplane1(startx3,starty3-1)+Process_bitplane1(startx3-1,starty3)+Process_bitplane1(startx3+1,starty3)==3)&& Process_bitplane1(startx3,starty3)==1 
           tag_NUB(i)=0;
        else
           tag_NUB(i)=1;        
        end
     end
     if tag_NUB(i)==0
       if (Process_bitplane1(startx4,starty4-1)+Process_bitplane1(startx4-1,starty4)+Process_bitplane1(startx4,starty4+1)==0 || Process_bitplane1(startx4,starty4-1)+Process_bitplane1(startx4-1,starty4)+Process_bitplane1(startx4,starty4+1)==1)&& Process_bitplane1(startx4,starty4)==0 
          tag_NUB(i)=0;
       elseif (Process_bitplane1(startx4,starty4-1)+Process_bitplane1(startx4-1,starty4)+Process_bitplane1(startx4,starty4+1)==3 || Process_bitplane1(startx4,starty4-1)+Process_bitplane1(startx4-1,starty4)+Process_bitplane1(startx4,starty4+1)==3)&& Process_bitplane1(startx4,starty4)==1 
          tag_NUB(i)=0;
       else
          tag_NUB(i)=1;          
       end
     end
     %---------------�任����---------------------%
     if starty1 + block_size > block_n*block_size  %��������ÿ�����һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
        startx1 = startx1 + block_size;
        starty1 = starty1 - (block_n-1)*block_size;
    else
        starty1 = starty1 + block_size;
    end
    if starty2 + block_size > block_n*block_size  %��������ÿ�����һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
        startx2 = startx2 + block_size;
        starty2 = starty2 - (block_n-1)*block_size;
    else
        starty2 = starty2 + block_size;
    end
    if starty3 + block_size > block_n*block_size  %��������ÿ�����һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
        startx3 = startx3 + block_size;
        starty3 = starty3 - (block_n-1)*block_size;
    else
        starty3 = starty3 + block_size;
    end
    if starty4 + block_size > block_n*block_size  %��������ÿ�����һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
        startx4 = startx4 + block_size;
        starty4 = starty4 - (block_n-1)*block_size;
    else
        starty4 = starty4 + block_size;
    end
end
 
end
