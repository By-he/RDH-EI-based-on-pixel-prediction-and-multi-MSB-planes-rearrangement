clear
clc
dbstop if error
I = imread('Tiffany.tiff');
Origin_I = double(I); 
%% �������Ƕ�������
num = 2100000; %�������ݵĳ���
rand('seed',0);
Data = round(rand(1,num)*1);
%% ͼ��Ԥ����
block_size = 3;
load('PE_bitplane2')
[Process_bitplane2,tag,f,recover_start_ubx,recover_start_uby,finalem_x1,finalem_y1] = rerrange(PE_bitplane2,block_size);