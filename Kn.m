k=input('k=');%����k��ֵ

%һά�����
x1=-4:0.01:4;%�Ա���x��ȡֵ��Χ
dis1=zeros(length(x1),10);%dis1��i��j�������i���Ա���x�����j��������ľ���
for i=1:length(x1)%����dis1��i��j��
    for j=1:10
        dis1(i,j)=abs(x1(i)-train(j,7));
    end
end
%p=Pn(x1,dis1,k);%���ÿ���Ա����ĸ����ܶ�
%plot(x1,p,'b');hold on;%�����Ա����ĸ����ܶ�����ͼ

%��ά�����
a=-4:0.01:4;
b=-4:0.01:4;
x2=zeros(length(a)*length(b),2);%�Ա���x��ȡֵ��Χ
for i=1:length(a)
    for j=1:length(b)
        x2((i-1)*length(a)+j,1)=a(i);
        x2((i-1)*length(a)+j,2)=b(j);
    end
end
dis2=zeros(length(x2),10);%dis2��i��j�������i���Ա���x�����j��������ľ���
for i=1:length(x2)
    for j=1:10
        dis2(i,j)=sqrt((x2(i,1:2)-train(j,4:5))*(x2(i,1:2)-train(j,4:5)).');%����dis2��i��j��
    end
end
p=Pn(x2,dis2,k);%���ÿ���Ա����ĸ����ܶ�
cx=-4:0.01:4;
cy=-4:0.01:4;
cz=griddata(x2(:,1),x2(:,2),p(:,1),cx,cy','cubic');
meshz(cx,cy,cz)%�����Ա����ĸ����ܶ�����ͼ

%��ά�����
x3=[-0.41,0.82,0.88;0.14,0.72,4.1;-0.81,0.61,-0.38];%�Ա���x��ȡֵ
dis3=zeros(3,10);%dis3��i��j�������i���Ա���x�������1�е�j��������ľ���
dis4=zeros(3,10);%dis4��i��j�������i���Ա���x�������2�е�j��������ľ���
dis5=zeros(3,10);%dis5��i��j�������i���Ա���x�������3�е�j��������ľ���
for i=1:3
    for j=1:10
        dis3(i,j)=sqrt((x3(i,:)-train(j,1:3))*(x3(i,:)-train(j,1:3)).');%����dis1��i��j��
        dis4(i,j)=sqrt((x3(i,:)-train(j,4:6))*(x3(i,:)-train(j,4:6)).');%����dis2��i��j��
        dis5(i,j)=sqrt((x3(i,:)-train(j,7:9))*(x3(i,:)-train(j,7:9)).');%����dis3��i��j��
    end
end
%p1=Pn(x3,dis3,k);%����3�����Ե������1�������еĸ����ܶ�
%p2=Pn(x3,dis4,k);%����3�����Ե������2�������еĸ����ܶ�
%p3=Pn(x3,dis5,k);%����3�����Ե������3�������еĸ����ܶ�