clear
clc
dbstop if error
I = imread('Lena.tiff');
%I = imread('Airplane.tiff');
%I = imread('Baboon.tiff');
%I = imread('Jetplane.tiff');
%I = imread('Tiffany.tiff');
%I = imread('Man.tiff');
Origin_I = double(I); 
imshow(Origin_I,[]);
subplot(221);imshow(Origin_I,[]);title('ԭʼͼ��');
%% �������Ƕ�������
num = 4000000; %�������ݵĳ���
rand('seed',0);
Data = round(rand(1,num)*1);
%% 
[row,col] = size(Origin_I);
block_size =4;
%% ͼ�������Կ�����ݼ�����Կ
Image_key=1;
Data_key=2;
%% ͼ�������в���Ƕtypeimage
[typeI1,typeI2,typeI3,typeI4,typeI5,typeI6,typeI7,typeI8,compress_type_len,recover_start_ub,Predict_error_I,judge_predict,compress_predict,tag_preprocess,finalem,f,Process_bitplane1,Process_bitplane2,Process_bitplane3,Process_bitplane4,Process_bitplane5,Process_bitplane6,Process_bitplane7,Process_bitplane8] = Preprocess1(Origin_I,block_size);
%% �ж�ÿ��NUB�Ƿ��Ƕ������������,Ƕ��UB
[bin_NUB_len,final_emUBdata,tag_NUB1,tag_NUB2,tag_NUB3,tag_NUB4,tag_NUB5,tag_NUB6,tag_NUB7,tag_NUB8,Second_pro_bitplane1,Second_pro_bitplane2,Second_pro_bitplane3,Second_pro_bitplane4,Second_pro_bitplane5,Second_pro_bitplane6,Second_pro_bitplane7,Second_pro_bitplane8] = Preprocess2(compress_type_len,tag_preprocess,finalem,f,block_size,Process_bitplane1,Process_bitplane2,Process_bitplane3,Process_bitplane4,Process_bitplane5,Process_bitplane6,Process_bitplane7,Process_bitplane8);
%% ͼ�����
[Process_I] = eight_to_one(Second_pro_bitplane1,Second_pro_bitplane2,Second_pro_bitplane3,Second_pro_bitplane4,Second_pro_bitplane5,Second_pro_bitplane6,Second_pro_bitplane7,Second_pro_bitplane8);
[Encrypt_I] = Encrypt_image(Process_I,Image_key,final_emUBdata,f,tag_preprocess,block_size);
subplot(222);
imshow(Encrypt_I,[]);
%% UB����Ƕ��
[emubD,num_emubD,num_em_everyub,Stego_bitplane1,Stego_bitplane2,Stego_bitplane3,Stego_bitplane4,Stego_bitplane5,Stego_bitplane6,Stego_bitplane7,Stego_bitplane8] = Embed_data(Encrypt_I,block_size,Data,num,tag_preprocess,final_emUBdata,f);

%% NUB����Ƕ��
[emNUBD,num_NUBD,num_NUBD_every,final_Stego1,final_Stego2,final_Stego3,final_Stego4,final_Stego5,final_Stego6,final_Stego7,final_Stego8] = Embed_NUBdata(block_size,num_emubD,Data,tag_preprocess,f,Stego_bitplane1,Stego_bitplane2,Stego_bitplane3,Stego_bitplane4,Stego_bitplane5,Stego_bitplane6,Stego_bitplane7,Stego_bitplane8,tag_NUB1,tag_NUB2,tag_NUB3,tag_NUB4,tag_NUB5,tag_NUB6,tag_NUB7,tag_NUB8);
[Stego_I] = eight_to_one(final_Stego1,final_Stego2,final_Stego3,final_Stego4,final_Stego5,final_Stego6,final_Stego7,final_Stego8);
subplot(223);
imshow(Stego_I,[]);

%% ��ȡUB���������Ϣ
[exUB_Data,exUB_numData] = Extract_UBdata(tag_preprocess,num_emubD,final_emUBdata,block_size,final_Stego1,final_Stego2,final_Stego3,final_Stego4,final_Stego5,final_Stego6,final_Stego7,final_Stego8);
%% ��ȡNUB���������Ϣ
[exNUB_Data,exNUB_numData] = Extract_NUBdata(tag_preprocess,num_NUBD,block_size,tag_NUB1,tag_NUB2,tag_NUB3,tag_NUB4,tag_NUB5,tag_NUB6,tag_NUB7,tag_NUB8,final_Stego1,final_Stego2,final_Stego3,final_Stego4,final_Stego5,final_Stego6,final_Stego7,final_Stego8);
%% �Ƚ���ȡ��Ƕ��
check1 = isequal(Data(1:num_emubD),exUB_Data);
if check1 == 1
  disp('UB��ȡ������Ƕ��������ȫ��ͬ��')
else
  disp('UB������ȡ����')
end
check2 = isequal(Data(num_emubD+1:num_emubD+num_NUBD),exNUB_Data);
if check2 == 1
  disp('NUB��ȡ������Ƕ��������ȫ��ͬ��')
else
  disp('NUB������ȡ����')
end
%% Ƕ����
compress_predict_len = length(compress_predict); %�ж������Ƿ�ɸı�ı��
ER=((num_emubD+num_NUBD-compress_predict_len-8-16*8-16*8)/(row*col)); 
disp(['Embedding rate equal to : ' num2str(ER)])
%8��tag��Ŀ��2*8*8��ÿ��λƽ����һ��16λ�����Ʊ�ʾѹ����NUB���ܸ�����δǶ�룩��16*8��ÿ��λƽ��ѹ����typeimage�ĸ���
% ͼ��Ҫ���ܺ󣬲��ָܻ�
%% ͼ��ָ�
%--------����--------%
[Decrypt_I] = decrypt_image(Stego_I,Image_key,final_emUBdata,f,tag_preprocess,block_size);
%----------------�ָ��õ�Ԥ�����λƽ��----------------%
[recover_bitplane1,recover_bitplane2,recover_bitplane3,recover_bitplane4,recover_bitplane5,recover_bitplane6,recover_bitplane7,recover_bitplane8] = Recover_image1(Decrypt_I,compress_type_len,tag_preprocess,recover_start_ub,block_size,typeI1,typeI2,typeI3,typeI4,typeI5,typeI6,typeI7,typeI8,tag_NUB1,tag_NUB2,tag_NUB3,tag_NUB4,tag_NUB5,tag_NUB6,tag_NUB7,tag_NUB8,final_Stego1,final_Stego2,final_Stego3,final_Stego4,final_Stego5,final_Stego6,final_Stego7,final_Stego8);
%----------------�õ�ԭʼͼ��--------------------%
[Recover_I,Prediction_I] = Recover_image2(judge_predict,recover_bitplane1,recover_bitplane2,recover_bitplane3,recover_bitplane4,recover_bitplane5,recover_bitplane6,recover_bitplane7,recover_bitplane8);
subplot(224);imshow(Recover_I,[]);title('�ָ�ͼ��'); 
%% �жϻָ�ͼ��
check3 = isequal(Origin_I,Recover_I);
if check3 == 1
  disp('�ع�ͼ����ԭʼͼ����ȫ��ͬ��')
else
  disp('Warning��ͼ���ع�����')
end