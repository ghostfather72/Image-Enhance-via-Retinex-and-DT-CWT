% ִ��ͼ��������
function out=image_load(vargin)
% ���룺
%   vargin��һ�ַ�������������ͼ�񣬸�ʽΪ--����.��׺��
% �����
%   outΪ���õ�ͼ��
% ���е�ͼ��Ĭ�ϱ����������ļ���
str1='/Users/HyrumCheung/Documents/MATLAB/Retinex/image_set/';
if nargin==0
    str2='whitehouse.png';
else
    str2=vargin;
end
out=imread([str1,str2]);