function [Process_bitplane1,tag,f,recover_start_ubx,recover_start_uby,finalem_x1,finalem_y1] = rerrange(PE_bitplane1,block_size)
%���˵����f��NUB�Ŀ�����
[row,col] = size(PE_bitplane1); %ͳ��ͼ���������
block_m = floor(row/block_size);  %�ֿ��СΪblock_size*block_size
block_n = floor(col/block_size);  %�ֿ����Ϊblock_m*block_n��ÿ����block_m���ֿ�
typeI = ones(block_m,block_n)*Inf;  %����type image 128*128����
Process_bitplane1 = PE_bitplane1;
tag =0;%��¼��ǰλƽ����û�������еı��
%% ����typeimage
for i=1:block_m
    for j=1:block_n
        start_x = (i-1)*block_size + 1; %��ÿ���ֿ����ʼ����
        start_y = (j-1)*block_size + 1;
        flag = PE_bitplane1(start_x,start_y);
        for t = 0:block_size-1  %���ÿ�������Ƿ��Ǿ��ȿ飬����NUB����typeimageΪ0������Ϊ1
            for k = 0:block_size-1
                if PE_bitplane1(start_x+t,start_y+k) == flag
                    typeI(i,j) = 1;
                else
                    typeI(i,j) = 0; %ֻҪ������һ����ͬ����break
                    break;
                end
            end
            if typeI(i,j) == 0   %0��NUB
                break;
            end
        end
    end
end
f = 0; %���ͼ����NUBs�Ŀ���f
for i=1:block_m
    for j=1:block_n
        if typeI(i,j) == 0
            f = f + 1;
        end
    end
end
ftypeI = block_m*block_n; %typeI������������Ŀ
start_nubx = 1; %����ͼ����ÿ��NUBs�ֿ����ʼ����
start_nuby = 1;
% start_ubx = floor(f/block_m)*4+1; %����ͼ����UBs�Ŀ�ʼ����
% start_uby = (f - block_m*(start_ubx-1)/block_size)*block_size + 1;
 start_ubx = floor(f/block_n)*block_size+1; %����ͼ����UBs�Ŀ�ʼ����(���ˣ���)
 start_uby = (mod(f,block_n))*block_size + 1;
recover_start_ubx = start_ubx; %���棬�ָ�ͼ��ʱҪ��
recover_start_uby = start_uby;
%% ��������
if (block_m*block_n-f)*(block_size*block_size-1)<=ftypeI %UBװ����typeimage����������
    tag=0;
else
    tag=1;
end
if tag==1
 for i=1:block_m
    for j=1:block_n
        start_x = (i-1)*block_size + 1; %ԭʼͼ�����ɨ�裬ÿ���ֿ����ʼ����
        start_y = (j-1)*block_size + 1;
        if typeI(i,j) == 0       %type image��0���� NUBs
            for x=0:block_size-1  %�����ÿ���ֿ����ʼ������������ͼ����NUBs������,����NUBs�ŵ�����ͼ����Ϸ�
                for y=0:block_size-1
                    vx = start_x + x; %ԭʼͼ��������
                    vy = start_y + y;
                    nubx = start_nubx + x; %������ͼ����ÿ��NUB�ֿ��У��������ص������
                    nuby = start_nuby + y;
                    Process_bitplane1(nubx,nuby) = PE_bitplane1(vx,vy);
                end
            end
%             if nuby == col
            if nuby == block_n*block_size %��Ƕ���NUB�ﵽÿ�����һ���������껻����һ��
                start_nubx = nubx + 1;
                start_nuby = 1;
            else
                start_nuby = nuby + 1;
            end
        else
            for x=0:block_size-1    %UB��26�У���85���飬��337��
                for y=0:block_size-1
                    vx = start_x + x; %ԭʼͼ��������
                    vy = start_y + y;
                    ubx = start_ubx + x; %������ͼ����ÿ���ֿ�����������
                    uby = start_uby + y;
                    Process_bitplane1(ubx,uby) = PE_bitplane1(vx,vy); %��UBs�ŵ�����ͼ�������
                end
            end
%             if uby == col 
            if uby == block_n*block_size %��Ƕ���UB�ﵽÿ�����һ���������껻����һ��
                start_ubx = ubx + 1;
                start_uby = 1;
            else
                start_uby = uby + 1;
            end
        end
    end
 end
end
%% ��typeI����ת��Ϊһά���飬Ƕ�뵽UBs��(Ҫ��¼typeIǶ��Ľ���λ��)
if tag==1
 EMtypeI = reshape(typeI.',1,block_m*block_n); %��ҪǶ���type image
 start_EMubx = recover_start_ubx; %����ͼ����UBs�Ŀ�ʼ����
 start_EMuby = recover_start_uby;
 g = 0; %EMtypeIǶ��ĸ���
 for i=1:block_m
    for j=1:block_n
        if (i-1)*block_n+j>f %��������UB�飬������NUB
            for x=0:block_size-1       %�����ÿ���ֿ����ʼ��������Ԥ�����
                for y=0:block_size-1
                    if g >= ftypeI %typeI�����Ѿ�ȫ��Ƕ�꣬���²�Ƕ��
                        break;  
                    end
                    if x~=block_size-1 || y~=block_size-1 %���µ�һ������Ԥ�����أ�����
                        g = g + 1;
                        vx = start_EMubx + x; %����������
                        vy = start_EMuby + y;
                        Process_bitplane1(vx,vy) = EMtypeI(g);
                        
                    end
                end
            end
%             if vy+1==col
            if vy+1 == block_n*block_size
                start_EMubx = vx + 1;
                start_EMuby = 1;
            else
                start_EMuby = vy + 2;
            end
        else
            break;
        end
        if g >= ftypeI %��Ƕ���type image ������������UBs�п�Ƕ��ռ�
            break;
        end
    end
 end
end
%% ����typeI���һλ��Ƕ��λ��,�� ������UB��Ƕ���������ݵ� ��ʼ����
finalem_x1 = 0;
finalem_y1 = 0;
ftypeI_block = ceil(block_m*block_n/(block_size*block_size-1));%typeiageռ�õ�4*4����(1093��)
if tag==1 
    if mod(block_m*block_n,(block_size*block_size-1))==0 %���typeimageռ�õĿ�����������������ÿһ���鶼Ƕ����
        if mod((f + ftypeI_block),block_n)==0 %NUB��������Typeռ�ÿ�����������ĳһ�� ���������һ��,����һ�е�һ������Ƕ����Ϣ
            finalem_x1 = ( (f + ftypeI_block)/block_n ) *block_size +1 ;
            finalem_y1 = 1;
        else %��֮����type����һ����ĵ�һ�����꣬Ƕ����Ϣ
            finalem_x1 = floor((f + ftypeI_block)/block_n)*block_size+1;
            finalem_y1 = mod((f + ftypeI_block),block_n)*block_size+1;
        end
    else %typeimageռ�õĿ���������
       finalblock_typeInum = mod(block_m*block_n,(block_size*block_size-1)); %Ƕ��typeimage���һ�������ϢǶ����
       if mod(finalblock_typeInum,block_size)==0 %���һ�������ϢǶ������4�ı���
           finalem_y1= mod(f+ftypeI_block-1,block_n)*block_size + 1;
           finalem_x1= floor((f+ftypeI_block-1)/block_n)*block_size + (finalblock_typeInum/block_size);
       else %���һ����Ƕ��type����Ϣ������4����
           finalem_y1= mod(f+ftypeI_block-1,block_n)*block_size + mod(finalblock_typeInum,block_size); 
           finalem_x1= floor((f+ftypeI_block-1)/block_n)*block_size + floor(finalblock_typeInum/block_size);
       end
    end
end
end %������

