function [recover_bitplane1,recover_bitplane2,recover_bitplane3,recover_bitplane4,recover_bitplane5,recover_bitplane6,recover_bitplane7,recover_bitplane8] = Recover_image1(Decrypt_I,compress_type_len,tag_preprocess,recover_start_ub,block_size,typeI1,typeI2,typeI3,typeI4,typeI5,typeI6,typeI7,typeI8,tag_NUB1,tag_NUB2,tag_NUB3,tag_NUB4,tag_NUB5,tag_NUB6,tag_NUB7,tag_NUB8,final_Stego1,final_Stego2,final_Stego3,final_Stego4,final_Stego5,final_Stego6,final_Stego7,final_Stego8)
%�������룺compress_type_len(ÿ��λƽ��ѹ�����type����),tag_preprocess(�жϵ�ǰλƽ���Ƿ�����˵���),recover_start_ub(UB�ָ�������),tag_NUB1(�ж���ЩNUB��Ҫ�ָ�)
%���������
%����˵����
[row,col] = size(Decrypt_I);
%% �����ܺ��ͼ���Ϊ�˸�λƽ��
decrypt_bitplane1 = ones(row,col)*Inf;decrypt_bitplane2 = ones(row,col)*Inf;decrypt_bitplane3 = ones(row,col)*Inf;decrypt_bitplane4 = ones(row,col)*Inf;
decrypt_bitplane5 = ones(row,col)*Inf;decrypt_bitplane6 = ones(row,col)*Inf;decrypt_bitplane7 = ones(row,col)*Inf;decrypt_bitplane8 = ones(row,col)*Inf;
bin2=zeros(1,8);
for i=1:row
  for j=1:col
        value=Decrypt_I(i,j);
        [bin2] = Decimalism_Binary(value);
        decrypt_bitplane1(i,j) =  bin2(1);
        decrypt_bitplane2(i,j) =  bin2(2);
        decrypt_bitplane3(i,j) =  bin2(3);
        decrypt_bitplane4(i,j) =  bin2(4);
        decrypt_bitplane5(i,j) =  bin2(5);
        decrypt_bitplane6(i,j) =  bin2(6);
        decrypt_bitplane7(i,j) =  bin2(7);
        decrypt_bitplane8(i,j) =  bin2(8);
  end
end
%% 
recover_bitplane1=decrypt_bitplane1;recover_bitplane2=decrypt_bitplane2;recover_bitplane3=decrypt_bitplane3;recover_bitplane4=decrypt_bitplane4;
recover_bitplane5=decrypt_bitplane5;recover_bitplane6=decrypt_bitplane6;recover_bitplane7=decrypt_bitplane7;recover_bitplane8=decrypt_bitplane8;

if tag_preprocess(1)==1
   recover_start_ubx1=recover_start_ub(1,1); %��ʼ�ָ�UB������
   recover_start_uby1=recover_start_ub(1,2);
   compress_type_len1=compress_type_len(1);
   [recover_bitplane1] = recover_onebitplane(typeI1,compress_type_len1,block_size,tag_NUB1,recover_start_ubx1,recover_start_uby1,decrypt_bitplane1);
end
if tag_preprocess(2)==1
   recover_start_ubx2=recover_start_ub(2,1); %��ʼ�ָ�UB������
   recover_start_uby2=recover_start_ub(2,2);
   compress_type_len2=compress_type_len(2);
   [recover_bitplane2] = recover_onebitplane(typeI2,compress_type_len2,block_size,tag_NUB2,recover_start_ubx2,recover_start_uby2,decrypt_bitplane2);
end
if tag_preprocess(3)==1
   recover_start_ubx3=recover_start_ub(3,1); %��ʼ�ָ�UB������
   recover_start_uby3=recover_start_ub(3,2);
   compress_type_len3=compress_type_len(3);
   [recover_bitplane3] = recover_onebitplane(typeI3,compress_type_len3,block_size,tag_NUB3,recover_start_ubx3,recover_start_uby3,decrypt_bitplane3);
end
if tag_preprocess(4)==1
   recover_start_ubx4=recover_start_ub(4,1); %��ʼ�ָ�UB������
   recover_start_uby4=recover_start_ub(4,2);
   compress_type_len4=compress_type_len(4);
   [recover_bitplane4] = recover_onebitplane(typeI4,compress_type_len4,block_size,tag_NUB4,recover_start_ubx4,recover_start_uby4,decrypt_bitplane4);
end
if tag_preprocess(5)==1
   recover_start_ubx5=recover_start_ub(5,1); %��ʼ�ָ�UB������
   recover_start_uby5=recover_start_ub(5,2);
   compress_type_len5=compress_type_len(5);
   [recover_bitplane5] = recover_onebitplane(typeI5,compress_type_len5,block_size,tag_NUB5,recover_start_ubx5,recover_start_uby5,decrypt_bitplane5);
end
if tag_preprocess(6)==1
   recover_start_ubx6=recover_start_ub(6,1); %��ʼ�ָ�UB������
   recover_start_uby6=recover_start_ub(6,2);
   compress_type_len6=compress_type_len(6);
   [recover_bitplane6] = recover_onebitplane(typeI6,compress_type_len6,block_size,tag_NUB6,recover_start_ubx6,recover_start_uby6,decrypt_bitplane6);
end
if tag_preprocess(7)==1
   recover_start_ubx7=recover_start_ub(7,1); %��ʼ�ָ�UB������
   recover_start_uby7=recover_start_ub(7,2);
   compress_type_len7=compress_type_len(7);
   [recover_bitplane7] = recover_onebitplane(typeI7,compress_type_len7,block_size,tag_NUB7,recover_start_ubx7,recover_start_uby7,decrypt_bitplane7);
end
if tag_preprocess(8)==1
   recover_start_ubx8=recover_start_ub(8,1); %��ʼ�ָ�UB������
   recover_start_uby8=recover_start_ub(8,2);
   compress_type_len8=compress_type_len(8);
   [recover_bitplane8] = recover_onebitplane(typeI8,compress_type_len8,block_size,tag_NUB8,recover_start_ubx8,recover_start_uby8,decrypt_bitplane8);
end

end


function [recover_bitplane1] = recover_onebitplane(typeI,compress_type_len1,block_size,tag_NUB1,recover_start_ubx1,recover_start_uby1,final_Stego1)
%RECOVER_BIT2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵
[row,col] = size(final_Stego1); %ͳ��ͼ���������
block_m = floor(row/block_size);  %�ֿ��СΪblock_size*block_size
block_n = floor(col/block_size);  %�ֿ����Ϊblock_m*block_n��ÿ����block_m���ֿ�

ftypeI_block = ceil(compress_type_len1/(block_size*block_size-1));%typeiageռ�õ�4*4����(1093��)
ftype_num = compress_type_len1; %typeimageԪ������
typeimage1=ones(1,ftype_num)*Inf; %����װtypeimage������

t=0; %typeimage������
%% ��ȡtypeimage
recover_x1=recover_start_ubx1;
recover_y1=recover_start_uby1;
for m=1:ftypeI_block
  for p=0:block_size-1
    for q=0:block_size-1
        if t== ftype_num %�Ѿ���ȡ��typeimage��
            break;
        end
        if p~=block_size-1 || q~=block_size-1
            t=t+1;
            vx = recover_x1 + p;
            vy = recover_y1 + q;
            typeimage1(t)= final_Stego1(vx,vy);
        end 
    end
    if t== ftype_num  %�Ѿ���ȡ��typeimage��
       break;
    end
  end
  if vy+1 == block_n*block_size
     recover_x1 = vx + 1;
     recover_y1 = 1;
  else
     recover_y1 = vy + 2;
  end 
end
%% �ڶ���λƽ���UB
[row,col] = size(final_Stego1); %ͳ��ͼ���������
block_m = floor(row/block_size);  %�ֿ��СΪblock_size*block_size
block_n = floor(col/block_size);  %�ֿ����Ϊblock_m*block_n��ÿ����block_m���ֿ�

UBx1 = recover_start_ubx1;
UBy1 = recover_start_uby1;
% ftype_num=block_m*block_n;
fnub1 = length(tag_NUB1); %NUB�ĸ���
fub1 = block_m*block_n - fnub1; %UB�ĸ���
recover_bitplane1 = final_Stego1; %�ָ���λƽ��
for i = 1:fub1 
  for p=0:block_size-1
    for q=0:block_size-1
        px = final_Stego1(UBx1+block_size-1,UBy1+block_size-1);
        if p~=block_size-1 || q~=block_size-1
            vx = UBx1 + p;
            vy = UBy1 + q;
            recover_bitplane1(vx,vy) = px;
        end   
    end
  end
  if vy+1 == block_n*block_size
     UBx1 = vx + 1;
     UBy1 = 1;
  else
     UBy1 = vy + 2;
  end
end
%% �ָ�NUB��������ȡѹ�����NUB��ֱ�ӻָ���
startnub_x1 = 1;startnub_y1 = 3;
startnub_x2 = 2;startnub_y2 = 1;
startnub_x3 = 3;startnub_y3 = 4;
startnub_x4 = 4;startnub_y4 = 2;
for i = 1:fnub1
    if tag_NUB1(i)==0 % NUB�ı����0�����Ƕ��
       if  (final_Stego1(startnub_x1,startnub_y1-1)+final_Stego1(startnub_x1+1,startnub_y1)+final_Stego1(startnub_x1,startnub_y1+1)==0) || (final_Stego1(startnub_x1,startnub_y1-1)+final_Stego1(startnub_x1+1,startnub_y1)+final_Stego1(startnub_x1,startnub_y1+1)==1)
           recover_bitplane1(startnub_x1,startnub_y1)=0; 
       else
           recover_bitplane1(startnub_x1,startnub_y1)=1;
       end
       if (final_Stego1(startnub_x2-1,startnub_y2)+final_Stego1(startnub_x2,startnub_y2+1)+final_Stego1(startnub_x2+1,startnub_y2)==0) || (final_Stego1(startnub_x2-1,startnub_y2)+final_Stego1(startnub_x2,startnub_y2+1)+final_Stego1(startnub_x2+1,startnub_y2)==1)
           recover_bitplane1(startnub_x2,startnub_y2)=0; 
       else
           recover_bitplane1(startnub_x2,startnub_y2)=1;  
       end
       if (final_Stego1(startnub_x3,startnub_y3-1)+final_Stego1(startnub_x3-1,startnub_y3)+final_Stego1(startnub_x3+1,startnub_y3)==0) || (final_Stego1(startnub_x3,startnub_y3-1)+final_Stego1(startnub_x3-1,startnub_y3)+final_Stego1(startnub_x3+1,startnub_y3)==1)
           recover_bitplane1(startnub_x3,startnub_y3)=0;
       else
           recover_bitplane1(startnub_x3,startnub_y3)=1;
       end
       if (final_Stego1(startnub_x4,startnub_y4-1)+final_Stego1(startnub_x4-1,startnub_y4)+final_Stego1(startnub_x4,startnub_y4+1)==0) || (final_Stego1(startnub_x4,startnub_y4-1)+final_Stego1(startnub_x4-1,startnub_y4)+final_Stego1(startnub_x4,startnub_y4+1)==1)
           recover_bitplane1(startnub_x4,startnub_y4)=0;
       else
           recover_bitplane1(startnub_x4,startnub_y4)=1;
       end
    end
    if startnub_y1 + block_size > block_n*block_size  %��������ÿ�����һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
        startnub_x1 = startnub_x1 + block_size;
        startnub_y1 = startnub_y1 - (block_n-1)*block_size;
    else
        startnub_y1 = startnub_y1 + block_size;
    end
    if startnub_y2 + block_size > block_n*block_size  %��������ÿ�����һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
        startnub_x2 = startnub_x2 + block_size;
        startnub_y2 = startnub_y2 - (block_n-1)*block_size;
    else
        startnub_y2 = startnub_y2 + block_size;
    end
    if startnub_y3 + block_size > block_n*block_size  %��������ÿ�����һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
        startnub_x3 = startnub_x3 + block_size;
        startnub_y3 = startnub_y3 - (block_n-1)*block_size;
    else
        startnub_y3 = startnub_y3 + block_size;
    end
    if startnub_y4 + block_size > block_n*block_size  %��������ÿ�����һ��NUB�飬���������Ϊ��һ�е�һ����ĵ�һ��Ƕ��λ�õ������꣬�����������ƶ�block_size������
        startnub_x4 = startnub_x4 + block_size;
        startnub_y4 = startnub_y4 - (block_n-1)*block_size;
    else
        startnub_y4 = startnub_y4 + block_size;
    end  
end
%% ���Żָ�------------UB------------%
% typeI=reshape(typeimage1,block_n,block_m); %��һλ����תΪcol��row�� ����Ϊreshape�����������
% typeI=typeI.'; %ת��
start_ubx = recover_start_ubx1;
start_uby = recover_start_uby1;
beforebitplane=recover_bitplane1;
for i=1:block_m
   for j=1:block_n
        start_x = (i-1)*block_size + 1; %ԭʼͼ�����ɨ�裬ÿ���ֿ����ʼ����
        start_y = (j-1)*block_size + 1;
%         if typeI(i,j) == 1  
        if typeI(i,j) == 0 
            ub_value =  beforebitplane(start_ubx+block_size-1,start_uby+block_size-1);                        %type image��1���� UBs
            for x2 =0:block_size-1  %�����ÿ���ֿ����ʼ������������ͼ����NUBs������,����NUBs�ŵ�����ͼ����Ϸ�
                for y2 = 0:block_size-1
                    vx = start_x + x2; %ԭʼͼ��������
                    vy = start_y + y2;
                    recover_bitplane1(vx,vy) = ub_value;
                end
            end
             if start_uby+block_size > block_n*block_size  %��Ƕ���UB�ﵽÿ�����һ���������껻����һ��
                 start_ubx = start_ubx + block_size;
                 start_uby = 1;
             else
                 start_uby = start_uby + block_size;
             end
        end
   end
end
%------------------NUB------------------------%
start_nubx=1;
start_nuby=1;
for i=1:block_m
  for j=1:block_n
        start_x = (i-1)*block_size + 1; %ԭʼͼ�����ɨ�裬ÿ���ֿ����ʼ����
        start_y = (j-1)*block_size + 1;
%         if typeI(i,j) == 0       %type image��0���� NUBs
        if typeI(i,j) == 1    
            for x=0:block_size-1  %�����ÿ���ֿ����ʼ������������ͼ����NUBs������,����NUBs�ŵ�����ͼ����Ϸ�
                for y=0:block_size-1
                    vx = start_x + x; %ԭʼͼ��������
                    vy = start_y + y;
                    nubx = start_nubx + x; %������ͼ����ÿ��NUB�ֿ��У��������ص������
                    nuby = start_nuby + y;
                    recover_bitplane1(vx,vy) =  beforebitplane(nubx,nuby);
                end
            end
            if nuby == block_n*block_size %��Ƕ���NUB�ﵽÿ�����һ���������껻����һ��
                start_nubx = nubx + 1;
                start_nuby = 1;
            else
                start_nuby = nuby + 1;
            end
        end
  end
end
end