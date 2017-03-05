function outval=meangrad(I)
% this function is used to calculate theaverage gradient of an image.
% ƽ���ݶȿ����еط�ӳͼ���΢Сϸ�ڷ����������������������ͼ���ģ���̶�
% ��ͼ���У�ĳһ����ĻҶȼ��仯�ʴ������ݶ�Ҳ�ʹ�
% ��ˣ�������ƽ���ݶ�ֵ������ͼ��������ȣ���ͬʱ��ӳ��ͼ����΢Сϸ�ڷ��������任������
n=ndims(I);
if n==3
    temp=0;
    for i=1:n
        [M,N]=size(I(:,:,i));
        tempX=zeros(M,N);
        tempY=zeros(M,N);
        tempX(1:M,1:(N-1))=I(1:M,2:N,i);
        tempY(1:(M-1),1:N)=I(2:M,1:N,i);
        diffX=tempX-I(:,:,i);% the differential value of X orient
        diffY=tempY-I(:,:,i);% the differential value of Y orient
        diffX(1:M,N)=0;% the boundery set to 0
        diffY(M,1:N)=0;
        diffX=diffX.*diffX;
        diffY=diffY.*diffY;
        gradval=(diffX+diffY)/2;% the gradient value of single pixel
        gradval=sum(sum(sqrt(gradval)));
        gradval=gradval/((M-1)*(N-1));
        temp=temp+gradval;
    end
    outval=temp/n;
else
    [M,N]=size(I);
    tempX=zeros(M,N);
    tempY=zeros(M,N);
    tempX(1:M,1:(N-1))=I(1:M,2:N);
    tempY(1:(M-1),1:N)=I(2:M,1:N);
    diffX=tempX-I;% the differential value of X orient
    diffY=tempY-I;% the differential value of Y orient
    diffX(1:M,N)=0;% the boundery set to 0
    diffY(M,1:N)=0;
    diffX=diffX.*diffX;
    diffY=diffY.*diffY;
    gradval=(diffX+diffY)/2;% the gradient value of single pixel
    gradval=sum(sum(sqrt(gradval)));
    outval=gradval/((M-1)*(N-1));
end