function outval=image_evaluate(I,Iref)
% Input: I��Iorg��ֵ��Ϊ[0,255]
% Output: ͼ���ֵ����׼�����Ϣ�أ�PSNR��ƽ���ݶȣ�SSIM��FSIM��VIF
I = double(I);
Iref = double(Iref);
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
%PSNR = psnr(I, Iref);

% ƽ���ݶ�
Gradval = meangrad(I);

% ��ԭͼ��SSIM(Structural SIMilarity index)
[SSIM, ssimmap]=ssim(I, Iref);

% ��ԭͼ��FSIM(Feature SIMilarity index)
[FSIM, FSIMc] = FeatureSIM(Iref, I);

% ��ԭͼ��QILV(Quality Index based on Local Variance)
%imorg = rgb2gray(I_original);
%imdist = rgb2gray(I);
%QILV = qilv(imdist, imorg, 0);

% ��ԭͼ��VIF(Visual Information Fidelity)
imorg = double(rgb2gray(uint8(Iref)));
imdist = double(rgb2gray(uint8(I)));
VIF = vifvec(imdist, imorg);

% Final output
outval = [Mean, Std, Gradval, SSIM, FSIM, VIF];