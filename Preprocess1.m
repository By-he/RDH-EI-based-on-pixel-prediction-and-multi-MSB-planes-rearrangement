function [typeI1,typeI2,typeI3,typeI4,typeI5,typeI6,typeI7,typeI8,compress_type_len,recover_start_ub,Predict_error_I,judge_predict,compress_predict,tag_preprocess,finalem,f,Process_bitplane1,Process_bitplane2,Process_bitplane3,Process_bitplane4,Process_bitplane5,Process_bitplane6,Process_bitplane7,Process_bitplane8] = Preprocess1(Origin_I,block_size)
% ����˵��������Ԥ�����ͼ�񣬽����Ϊ�˸�λƽ�棬��������
% ���룺Origin_I��ԭʼͼ�񣩣� block_size���ֿ��С��
% �����compress_type_len(ÿ��λƽ��typeѹ�����λ��),recover_start_ub��UB��ʼ���꣩��Predict_error_I(Ԥ�����ͼ��),judge_predict(�Ƿ�ΪԽ��Ԥ�����),tag_preprocess(��¼ÿ��λƽ���Ƿ�������),finalem(��UB�м���Ƕ��NUBѹ�����ݵ�λ��)��f��һά���飬λƽ����NUB��������
%% ����Ԥ�����ͼ��
[Predict_error_I,judge_predict,compress_predict] = Predict_error(Origin_I);
%% ����Ԥ�����λƽ��
[PE_bitplane1,PE_bitplane2,PE_bitplane3,PE_bitplane4,PE_bitplane5,PE_bitplane6,PE_bitplane7,PE_bitplane8] = One_to_eight(Predict_error_I,judge_predict);
%% ����8������λƽ��
[compress_type_len1,typeI1,Process_bitplane1,tag1,f1,recover_start_ubx1,recover_start_uby1,finalem_x1,finalem_y1] = Rearrange(PE_bitplane1,block_size);
[compress_type_len2,typeI2,Process_bitplane2,tag2,f2,recover_start_ubx2,recover_start_uby2,finalem_x2,finalem_y2] = Rearrange(PE_bitplane2,block_size);
[compress_type_len3,typeI3,Process_bitplane3,tag3,f3,recover_start_ubx3,recover_start_uby3,finalem_x3,finalem_y3] = Rearrange(PE_bitplane3,block_size);
[compress_type_len4,typeI4,Process_bitplane4,tag4,f4,recover_start_ubx4,recover_start_uby4,finalem_x4,finalem_y4] = Rearrange(PE_bitplane4,block_size);
[compress_type_len5,typeI5,Process_bitplane5,tag5,f5,recover_start_ubx5,recover_start_uby5,finalem_x5,finalem_y5] = Rearrange(PE_bitplane5,block_size);
[compress_type_len6,typeI6,Process_bitplane6,tag6,f6,recover_start_ubx6,recover_start_uby6,finalem_x6,finalem_y6] = Rearrange(PE_bitplane6,block_size);
[compress_type_len7,typeI7,Process_bitplane7,tag7,f7,recover_start_ubx7,recover_start_uby7,finalem_x7,finalem_y7] = Rearrange(PE_bitplane7,block_size);
[compress_type_len8,typeI8,Process_bitplane8,tag8,f8,recover_start_ubx8,recover_start_uby8,finalem_x8,finalem_y8] = Rearrange(PE_bitplane8,block_size);
%% ��������
tag_preprocess=zeros(1,8); %ÿ��λƽ���Ƿ��Ƕ��ı��
tag_preprocess(1:8)=[tag1 tag2 tag3 tag4 tag5 tag6 tag7 tag8];
finalem=zeros(8,2); %��UB��Ƕ��NUB����ʼ����
finalem(1,1)=finalem_x1;finalem(1,2)=finalem_y1;finalem(2,1)=finalem_x2;finalem(2,2)=finalem_y2;finalem(3,1)=finalem_x3;finalem(3,2)=finalem_y3;finalem(4,1)=finalem_x4;finalem(4,2)=finalem_y4;
finalem(5,1)=finalem_x5;finalem(5,2)=finalem_y5;finalem(6,1)=finalem_x6;finalem(6,2)=finalem_y6;finalem(7,1)=finalem_x7;finalem(7,2)=finalem_y7;finalem(8,1)=finalem_x8;finalem(8,2)=finalem_y8;
f=zeros(1,8);
f(1:8)=[f1 f2 f3 f4 f5 f6 f7 f8];
recover_start_ub=zeros(8,2); %�ָ�UB����ʼ����
recover_start_ub(1,1)=recover_start_ubx1;recover_start_ub(1,2)=recover_start_uby1;recover_start_ub(2,1)=recover_start_ubx2;recover_start_ub(2,2)=recover_start_uby2;
recover_start_ub(3,1)=recover_start_ubx3;recover_start_ub(3,2)=recover_start_uby3;recover_start_ub(4,1)=recover_start_ubx4;recover_start_ub(4,2)=recover_start_uby4;
recover_start_ub(5,1)=recover_start_ubx5;recover_start_ub(5,2)=recover_start_uby5;recover_start_ub(6,1)=recover_start_ubx6;recover_start_ub(6,2)=recover_start_uby6;
recover_start_ub(7,1)=recover_start_ubx7;recover_start_ub(7,2)=recover_start_uby7;recover_start_ub(8,1)=recover_start_ubx8;recover_start_ub(8,2)=recover_start_uby8;
compress_type_len=zeros(1,8);%ÿ��λƽ�棬typeimageѹ�����λ��
compress_type_len(1)=compress_type_len1;compress_type_len(2)=compress_type_len2;compress_type_len(3)=compress_type_len3;compress_type_len(4)=compress_type_len4;
compress_type_len(5)=compress_type_len5;compress_type_len(6)=compress_type_len6;compress_type_len(7)=compress_type_len7;compress_type_len(8)=compress_type_len8;
end

function [Predict_error_I,judge_predict,compress_predict] = Predict_error(Origin_I) 
[row,col] = size(Origin_I); %����origin_I������ֵ
Predict_error_I = Origin_I;  %�����洢origin_IԤ��ֵ������
judge_predict = ones(row,col)*Inf;
for i=2:row  %��һ���ǲο����أ�����Ԥ��
    for j=2:col  %��һ����Ϊ�ο����أ�����Ԥ��
        a = Origin_I(i-1,j);
        b = Origin_I(i-1,j-1);
        c = Origin_I(i,j-1);
        if b <= min(a,c)
            Predict_error_I(i,j) = Origin_I(i,j)-max(a,c);
            
        elseif b >= max(a,c)
            Predict_error_I(i,j) = Origin_I(i,j)-min(a,c);
        else
            Predict_error_I(i,j) = Origin_I(i,j)-(a + c - b);
        end
    end
end %����Ԥ�����ͼ��
%------------�жϳ��˲ο������⣬���ڵ�Խ��Ԥ��������أ�����64��С��-64��-----------%
i=1;
for j=1:col
   judge_predict(i,j)=0; %���вο����ص��ж϶���0������ȷ�ɻָ�����  
end
j=1;
for i=2:row
   judge_predict(i,j)=0;
end
for i=2:row
    for j=2:col
        if (Predict_error_I(i,j)>64 ) || (Predict_error_I(i,j)<-64)
            Predict_error_I(i,j) = Origin_I(i,j); %Խ�����ز�����Ԥ�����
            judge_predict(i,j)=1;
        else
            judge_predict(i,j)=0;
        end
    end
end
%------------- ѹ���ж�Ԥ�����ľ��󣬷������Ƕ�� -----------%
flow_map=judge_predict;

compress_predict_len = length(flow_map);
compress_predict = flow_map;
%after compression
cPos_x = cell(1,1);%��������ѹ��
cPos_x{1} = flow_map;
loc_Com =  arith07(cPos_x);
bin_index = 8;
[compress_predict, compress_predict_len] = dec_transform_bin(loc_Com, bin_index);

end 
function [PE_bitplane1,PE_bitplane2,PE_bitplane3,PE_bitplane4,PE_bitplane5,PE_bitplane6,PE_bitplane7,PE_bitplane8] = One_to_eight(Predict_error_I,judge_predict)
 [row,col] = size(Predict_error_I); 
 PE_bitplane1 = zeros(row,col);PE_bitplane2 = zeros(row,col);PE_bitplane3 = zeros(row,col);PE_bitplane4 = zeros(row,col);
 PE_bitplane5 = zeros(row,col);PE_bitplane6 = zeros(row,col);PE_bitplane7 = zeros(row,col);PE_bitplane8 = zeros(row,col);
 bin2 = zeros(1,8);
 i=1;
 for j=1:col
    bin2 = Decimalism_Binary(Predict_error_I(i,j)); %�ο����ز��ó����ʮ���ƻ���λ�����Ƶķ���
    PE_bitplane1(i,j)= bin2(1);PE_bitplane2(i,j)= bin2(2);PE_bitplane3(i,j)= bin2(3);PE_bitplane4(i,j)= bin2(4);
    PE_bitplane5(i,j)= bin2(5);PE_bitplane6(i,j)= bin2(6);PE_bitplane7(i,j)= bin2(7);PE_bitplane8(i,j)= bin2(8);       
 end
 j=1;
 for i=2:row
    bin2 = Decimalism_Binary(Predict_error_I(i,j)); %�ο����ز��ó����ʮ���ƻ���λ�����Ƶķ���
    PE_bitplane1(i,j)= bin2(1);PE_bitplane2(i,j)= bin2(2);PE_bitplane3(i,j)= bin2(3);PE_bitplane4(i,j)= bin2(4);
    PE_bitplane5(i,j)= bin2(5);PE_bitplane6(i,j)= bin2(6);PE_bitplane7(i,j)= bin2(7);PE_bitplane8(i,j)= bin2(8);      
 end
 for i=2:row
    for j=2:col
        if judge_predict(i,j)==0 %���Ϊ0����ǰ���ؿ��Լ���Ԥ���ֵ�ģ������
           bin2 = zf_Decimalism_Binary(Predict_error_I(i,j)); %bin2����ĵ�һ���������λƽ��
           PE_bitplane1(i,j)= bin2(1);PE_bitplane2(i,j)= bin2(2);PE_bitplane3(i,j)= bin2(3);PE_bitplane4(i,j)= bin2(4);
           PE_bitplane5(i,j)= bin2(5);PE_bitplane6(i,j)= bin2(6);PE_bitplane7(i,j)= bin2(7);PE_bitplane8(i,j)= bin2(8); 
        else
           bin2 = Decimalism_Binary(Predict_error_I(i,j)); %Խ�������޷���7λ��ʾ��Ҫ��8λ
           PE_bitplane1(i,j)= bin2(1);PE_bitplane2(i,j)= bin2(2);PE_bitplane3(i,j)= bin2(3);PE_bitplane4(i,j)= bin2(4);
           PE_bitplane5(i,j)= bin2(5);PE_bitplane6(i,j)= bin2(6);PE_bitplane7(i,j)= bin2(7);PE_bitplane8(i,j)= bin2(8); 
        end
    end
 end
end %�����˸�λƽ��
function [compress_type_len,typeI,Process_bitplane1,tag,f,recover_start_ubx,recover_start_uby,finalem_x1,finalem_y1] = Rearrange(PE_bitplane1,block_size)
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
                    typeI(i,j) = 0; %UB����0��NUB��1
                else
                    typeI(i,j) = 1; %ֻҪ������һ����ͬ����break
                    break;
                end
            end
            if typeI(i,j) == 1   
                break;
            end
        end
    end
end
f = 0; %���ͼ����NUBs�Ŀ���f
for i=1:block_m
    for j=1:block_n
        if typeI(i,j) == 1
            f = f + 1;
        end
    end
end
%% ѹ��typeimage
flow_map=typeI;

compress_type_len = length(flow_map);
compress_type = flow_map;
%after compression
cPos_x = cell(1,1);%��������ѹ��
cPos_x{1} = flow_map;
loc_Com =  arith07(cPos_x);
bin_index = 8;
[compress_type,compress_type_len] = dec_transform_bin(loc_Com, bin_index);
%--------------------------------------------------------------------------------------
ftypeI = compress_type_len; %typeI������������Ŀ
start_nubx = 1; %����ͼ����ÿ��NUBs�ֿ����ʼ����
start_nuby = 1;
start_ubx = floor(f/block_n)*block_size+1; %����ͼ����UBs�Ŀ�ʼ����
start_uby = (mod(f,block_n))*block_size + 1;
recover_start_ubx = start_ubx; %���棬�ָ�ͼ��ʱҪ��
recover_start_uby = start_uby;
%% ��������
% if (block_m*block_n-f)*(block_size*block_size-1)<= ftypeI  %UBװ����typeimage����������������
%     tag=0;
%     recover_start_ubx=0;
%     recover_start_uby=0; %��λƽ��û�������У����Բ������Ȼָ�UB
% else
%     tag=1;
% end
% if tag==1
 for i=1:block_m
    for j=1:block_n
        start_x = (i-1)*block_size + 1; %ԭʼͼ�����ɨ�裬ÿ���ֿ����ʼ����
        start_y = (j-1)*block_size + 1;
        if typeI(i,j) == 1       %type image��1���� NUBs ���Ĺ���
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
% end
%% ѹ��NUB,�жϵ�ǰλƽ���ܷ������в�Ƕ����Ϣ
[tag_NUB] = NUBjudge(Process_bitplane1,block_size,f);
flow_map=tag_NUB;
compress_NUB_len = length(flow_map);
compress_NUB = flow_map;
%after compression
cPos_x = cell(1,1);%��������ѹ��
cPos_x{1} = flow_map;
loc_Com =  arith07(cPos_x);
bin_index = 8;
[compress_NUB, compress_NUB_len] = dec_transform_bin(loc_Com, bin_index);
%----------------------------------------------------------------------------
if (block_m*block_n-f)*(block_size*block_size-1)<= (ftypeI+compress_NUB_len+15)  %UBװ����ѹ�����typeimage��ѹ�����NUB��������������
    tag=0;
    recover_start_ubx=0;
    recover_start_uby=0; %��λƽ��û�������У����Բ������Ȼָ�UB
    Process_bitplane1=PE_bitplane1; %ȡ�����������еĲ���
    compress_type_len=0; 
else
    tag=1;
end
%% ��typeI����ת��Ϊһά���飬Ƕ�뵽UBs��(Ҫ��¼typeIǶ��Ľ���λ��)
if tag==1
 EMtypeI = compress_type; %��ҪǶ���type image
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
                if g >= ftypeI %typeI�����Ѿ�ȫ��Ƕ�꣬���²�Ƕ��
                    break;  
                end
            end
            if vy+1 == block_n*block_size
                start_EMubx = vx + 1;
                start_EMuby = 1;
            else
                start_EMuby = vy + 2;
            end
        end
        if g >= ftypeI %��Ƕ���type image ������������UBs�п�Ƕ��ռ�
            break;
        end
    end
    if g >= ftypeI %��Ƕ���type image ������������typaimage����������
        break;
    end
 end
end
%% ����typeI���һλ��Ƕ��λ��,�� ������UB��Ƕ���������ݵ� ��ʼ���꣨���һ��Ƕ��typeimage�Ŀ飬ʣ��������ʱ��Ҫ��
finalem_x1 = 0;
finalem_y1 = 0;
ftypeI_block = ceil(ftypeI/(block_size*block_size-1));%ѹ�����typeiageռ�õ�4*4����(1093��)
if tag==1 
    last_block=mod((f+ftypeI_block),block_n); %��ǰ��һ�У��м���4*4�Ŀ�
    finalem_y1=last_block*block_size+1;
    finalem_x1=(floor((f+ftypeI_block)/block_n))*block_size+1;
end
end %������