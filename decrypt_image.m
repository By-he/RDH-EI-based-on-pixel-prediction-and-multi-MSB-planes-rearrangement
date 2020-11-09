function [Decrypt_I] = decrypt_image(Stego_I,Image_key,final_emUBdata,f,tag_preprocess,block_size)
%ENCRYPT_IMAGE �˴���ʾ�йش˺�����ժҪ
% final_emUBdata(��UB��Ƕ��������Ϣ������),f(NUB�ĸ���)
[row,col] = size(Stego_I);
%% ������Կ������origin_I��С��ͬ���������
rand('seed',Image_key); %��������
E = round(rand(row,col)*255); %�������row*col����
%% ���ܵ�8������
 E_bitplane1 = zeros(row,col);E_bitplane2 = zeros(row,col);E_bitplane3 = zeros(row,col);E_bitplane4 = zeros(row,col);
 E_bitplane5 = zeros(row,col);E_bitplane6 = zeros(row,col);E_bitplane7 = zeros(row,col);E_bitplane8 = zeros(row,col);
 bin = zeros(1,8);
 for i=1:row
    for j=1:col
           bin = Decimalism_Binary(E(i,j)); %Խ�������޷���7λ��ʾ��Ҫ��8λ
           E_bitplane1(i,j)= bin(1);E_bitplane2(i,j)= bin(2);E_bitplane3(i,j)= bin(3);E_bitplane4(i,j)= bin(4);
           E_bitplane5(i,j)= bin(5);E_bitplane6(i,j)= bin(6);E_bitplane7(i,j)= bin(7);E_bitplane8(i,j)= bin(8); 
    end
 end
%% ��Ԥ����ͼ���Ϊ8��λƽ��
decrypt_bitplane1 = ones(row,col)*Inf;decrypt_bitplane2 = ones(row,col)*Inf;decrypt_bitplane3 = ones(row,col)*Inf;decrypt_bitplane4 = ones(row,col)*Inf;
decrypt_bitplane5 = ones(row,col)*Inf;decrypt_bitplane6 = ones(row,col)*Inf;decrypt_bitplane7 = ones(row,col)*Inf;decrypt_bitplane8 = ones(row,col)*Inf;
stego_bitplane1=decrypt_bitplane1;stego_bitplane2=decrypt_bitplane2;stego_bitplane3=decrypt_bitplane3;stego_bitplane4=decrypt_bitplane4;
stego_bitplane5=decrypt_bitplane5;stego_bitplane6=decrypt_bitplane6;stego_bitplane7=decrypt_bitplane7;stego_bitplane8=decrypt_bitplane8;
bin2=zeros(1,8);
for i=1:row
  for j=1:col
        value=Stego_I(i,j);
       [bin2] = Decimalism_Binary(value);
        stego_bitplane1(i,j) =  bin2(1);
        stego_bitplane2(i,j) =  bin2(2);
        stego_bitplane3(i,j) =  bin2(3);
        stego_bitplane4(i,j) =  bin2(4);
        stego_bitplane5(i,j) =  bin2(5);
        stego_bitplane6(i,j) =  bin2(6);
        stego_bitplane7(i,j) =  bin2(7);
        stego_bitplane8(i,j) =  bin2(8);
  end
end
%% ����Ԥ����ͼ���8��λƽ�� 
if tag_preprocess(1)==1 %�����ǰΪƽ���ǿ�Ƕ���λƽ�棬��ôNUBȫ�����ܣ���ҪUBҪ��û��Ƕ�븨����Ϣ��λ�ÿ�ʼǶ��
    %NUB����
      f1=f(1);
      finalem_x1=final_emUBdata(1,1);
      finalem_y1=final_emUBdata(1,2);
      [decrypt_bitplane1] =decrypt_NUB(f1,stego_bitplane1,block_size,E_bitplane1);
      [final_debitplane1] = decrypt_UB(decrypt_bitplane1,E_bitplane1,finalem_x1,finalem_y1,block_size);  
else
    [final_debitplane1] = decrypt_All(stego_bitplane1,E_bitplane1,block_size);
end
%------------------------------------%
if tag_preprocess(2)==1
    %NUB����
      f2=f(2);
      finalem_x2=final_emUBdata(2,1);
      finalem_y2=final_emUBdata(2,2);
      [decrypt_bitplane2] =decrypt_NUB(f2,stego_bitplane2,block_size,E_bitplane2);
      [final_debitplane2] = decrypt_UB(decrypt_bitplane2,E_bitplane2,finalem_x2,finalem_y2,block_size);  
else
    [final_debitplane2] = decrypt_All(stego_bitplane2,E_bitplane2,block_size);
end
%------------------------------------%
if tag_preprocess(3)==1
    %NUB����
      f3=f(3);
      finalem_x3=final_emUBdata(3,1);
      finalem_y3=final_emUBdata(3,2);
      [decrypt_bitplane3] =decrypt_NUB(f3,stego_bitplane3,block_size,E_bitplane3);
      [final_debitplane3] = decrypt_UB(decrypt_bitplane3,E_bitplane3,finalem_x3,finalem_y3,block_size);  
else
    [final_debitplane3] = decrypt_All(stego_bitplane3,E_bitplane3,block_size);
end
%------------------------------------%
if tag_preprocess(4)==1
    %NUB����
      f4=f(4);
      finalem_x4=final_emUBdata(4,1);
      finalem_y4=final_emUBdata(4,2);
      [decrypt_bitplane4] =decrypt_NUB(f4,stego_bitplane4,block_size,E_bitplane4);
      [final_debitplane4] = decrypt_UB(decrypt_bitplane4,E_bitplane4,finalem_x4,finalem_y4,block_size);  
else
    [final_debitplane4] = decrypt_All(stego_bitplane4,E_bitplane4,block_size);
end
%------------------------------------%
if tag_preprocess(5)==1
    %NUB����
      f5=f(5);
      finalem_x5=final_emUBdata(5,1);
      finalem_y5=final_emUBdata(5,2);
      [decrypt_bitplane5] =decrypt_NUB(f5,stego_bitplane5,block_size,E_bitplane5);
      [final_debitplane5] = decrypt_UB(decrypt_bitplane5,E_bitplane5,finalem_x5,finalem_y5,block_size);  
else
    [final_debitplane5] = decrypt_All(stego_bitplane5,E_bitplane5,block_size);
end
%------------------------------------%
if tag_preprocess(6)==1
    %NUB����
      f6=f(6);
      finalem_x6=final_emUBdata(6,1);
      finalem_y6=final_emUBdata(6,2);
      [decrypt_bitplane6] =decrypt_NUB(f6,stego_bitplane6,block_size,E_bitplane6);
      [final_debitplane6] = decrypt_UB(decrypt_bitplane6,E_bitplane6,finalem_x6,finalem_y6,block_size);  
else
    [final_debitplane6] = decrypt_All(stego_bitplane6,E_bitplane6,block_size);
end
%------------------------------------%
if tag_preprocess(7)==1
    %NUB����
      f7=f(7);
      finalem_x7=final_emUBdata(7,1);
      finalem_y7=final_emUBdata(7,2);
      [decrypt_bitplane7] =decrypt_NUB(f7,stego_bitplane7,block_size,E_bitplane7);
      [final_debitplane7] = decrypt_UB(decrypt_bitplane7,E_bitplane7,finalem_x7,finalem_y7,block_size);  
else
    [final_debitplane7] = decrypt_All(stego_bitplane7,E_bitplane7,block_size);
    %------------------------------------%
if tag_preprocess(8)==1
    %NUB����
      f8=f(8);
      finalem_x8=final_emUBdata(8,1);
      finalem_y8=final_emUBdata(8,2);
      [decrypt_bitplane8] =decrypt_NUB(f8,stego_bitplane8,block_size,E_bitplane8);
      [final_debitplane8] = decrypt_UB(decrypt_bitplane8,E_bitplane8,finalem_x8,finalem_y8,block_size);  
else
    [final_debitplane8] = decrypt_All(stego_bitplane8,E_bitplane8,block_size);
end
end
[Decrypt_I] = eight_to_one(final_debitplane1,final_debitplane2,final_debitplane3,final_debitplane4,final_debitplane5,final_debitplane6,final_debitplane7,final_debitplane8);
end

function [decrypt_bitplane1] =decrypt_NUB(f1,stego_bitplane1,block_size,E_bitplane1)
%�������룺tag_NUB1(�ж�λƽ��NUB�Ŀ�Ƕ���),Stego_bitplane1,fnub(NUB����),Data(������Ϣ),emnub_t(Data��Ƕ��������Ϣ������)
%���������next_emnub_t(��һ��NUBλƽ�濪ʼǶ���Data����),tag_NUB1(�ж�λƽ��NUB�Ŀ�Ƕ����������󷽱�ѹ��)
%%
[row,col] = size(stego_bitplane1); %ͳ��ͼ���������
block_m = floor(row/block_size);  %�ֿ��СΪblock_size*block_size
block_n = floor(col/block_size);  %�ֿ����Ϊblock_m*block_n��ÿ����block_m���ֿ�
decrypt_bitplane1=stego_bitplane1;

%% ����NUB
startx=1;
starty=1;
for k=1:f1
    for i=0:block_size-1
        for j=0:block_size-1
           vx = startx + i;
           vy = starty + j;
           decrypt_bitplane1(vx,vy) = bitxor(stego_bitplane1(vx,vy),E_bitplane1(vx,vy) );
        end
    end
    if vy==block_n*block_size && mod(vx,block_size)==0 && vx~=block_m*block_size %��Ƕ�뵽ÿ�еĵ����ڶ��У���ΪԤ�����ز�Ƕ�룩,�Ҳ������һ��
          startx = vx + 1; %������һ��
          starty = 1;
    else
          starty = vy + 1;
    end
    if vy==block_n*block_size && vx==block_m*block_size
           break;
    end
end

end

function [final_debitplane1] = decrypt_UB(decrypt_bitplane1,E_bitplane1,finalem_x,finalem_y,block_size)
%% ��UBs��Ƕ���������� 

[row,col] = size(decrypt_bitplane1);

block_m = floor(row/block_size);  %�ֿ��СΪblock_size*block_size
block_n = floor(col/block_size);  %�ֿ����Ϊblock_m*block_n��ÿ����block_m���ֿ�
% ftypeI = ceil(block_m*block_n/(block_size*block_size-1)); %Ƕ��typeI��UB���� %�������¼���ȥ
final_debitplane1 = decrypt_bitplane1;

startx_encrypt = finalem_x; %UB��Ƕ���������ݵĿ�ʼ����
starty_encrypt = finalem_y;
%% ����

for t=1:(row*col)
       for p=0:block_size-1
          for q=0:block_size-1
                 vx = startx_encrypt + p;
                 vy = starty_encrypt + q;
                 final_debitplane1(vx,vy) = bitxor( decrypt_bitplane1(vx,vy),E_bitplane1(vx,vy) );
          end
       end
       if vy==block_n*block_size && mod(vx,block_size)==0 && vx~=block_m*block_size %��Ƕ�뵽ÿ�еĵ����ڶ��У���ΪԤ�����ز�Ƕ�룩,�Ҳ������һ��
          startx_encrypt = vx + 1; %������һ��
          starty_encrypt = 1;
       else
          starty_encrypt = vy + 1;
       end
       if vy==block_n*block_size && vx==block_m*block_size
           break;
       end

end %���ˣ��Ǵ�û��Ƕ��typeI��UB���п�ʼǶ��

end

function [final_debitplane1] = decrypt_All(stego_bitplane1,E_bitplane1,block_size)
%% ��UBs��Ƕ���������� 

[row,col] = size(stego_bitplane1);

block_m = floor(row/block_size);  %�ֿ��СΪblock_size*block_size
block_n = floor(col/block_size);  %�ֿ����Ϊblock_m*block_n��ÿ����block_m���ֿ�
% ftypeI = ceil(block_m*block_n/(block_size*block_size-1)); %Ƕ��typeI��UB���� %�������¼���ȥ
final_debitplane1 = stego_bitplane1;

startx_encrypt = 1; %UB��Ƕ���������ݵĿ�ʼ����
starty_encrypt = 1;
%% ����

for t=1:(row*col)
       for p=0:block_size-1
          for q=0:block_size-1
                 vx = startx_encrypt + p;
                 vy = starty_encrypt + q;
                 final_debitplane1(vx,vy) = bitxor( stego_bitplane1(vx,vy),E_bitplane1(vx,vy) );
          end
       end
       if vy==block_n*block_size && mod(vx,block_size)==0 && vx~=block_m*block_size %��Ƕ�뵽ÿ�еĵ����ڶ��У���ΪԤ�����ز�Ƕ�룩,�Ҳ������һ��
          startx_encrypt = vx + 1; %������һ��
          starty_encrypt = 1;
       else
          starty_encrypt = vy + 1;
       end
       if vy==block_n*block_size && vx==block_m*block_size
           break;
       end

end %���ˣ��Ǵ�û��Ƕ��typeI��UB���п�ʼǶ��

end