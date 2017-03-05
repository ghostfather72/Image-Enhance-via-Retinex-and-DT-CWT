function outval=image_evaluate(I,Iorg)
% Input: I��Iorg��ֵ��Ϊ[0,255]
% Output: ͼ���ֵ����׼�����Ϣ�أ�PSNR��ƽ���ݶȣ�SSIM��FSIM��VIF
I = double(I);
Iorg = double(Iorg);
n = ndims(I);
if n == 3
    % ͼ���ֵ
    Mean = (mean2(I(:, :, 1)) + mean2(I(:, :, 2)) + mean2(I(:, :, 3))) / 3;
    % ͼ�񷽲�
    Std = (std2(I(:, :, 1)) + std2(I(:, :, 2)) + std2(I(:, :, 3))) / 3;
else
    % ͼ���ֵ
    Mean = mean2(I);
    % ͼ�񷽲�
    Std = std2(I);
end

% ͼ����Ϣ��
%Entropy = entropy(I);

% ��ԭͼ�ľ�����
%MSE=immse(I, I_original);

% ��ԭͼ�ķ�ֵ�����
%PSNR = psnr(I, Iorg);

% ƽ���ݶ�
Gradval = meangrad(I);

% ��ԭͼ��SSIM(Structural SIMilarity index)
%[SSIM, ssimmap]=ssim(I, Iorg);

% ��ԭͼ��FSIM(Feature SIMilarity index)
%[FSIM, FSIMc] = FeatureSIM(Iorg, I);

% ��ԭͼ��QILV(Quality Index based on Local Variance)
%imorg = rgb2gray(I_original);
%imdist = rgb2gray(I);
%QILV = qilv(imdist, imorg, 0);

% ��ԭͼ��VIF(Visual Information Fidelity)
%addpath(genpath('VIF&PyrTools'))
%imorg = rgb2gray(Iorg);
%imdist = rgb2gray(I);
%VIF = vifvec(imorg, imdist);

% Final output
outval = [Mean, Std, Gradval];