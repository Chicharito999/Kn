k=input('k=');%输入k的值

%一维的情况
x1=-4:0.01:4;%自变量x的取值范围
dis1=zeros(length(x1),10);%dis1（i，j）代表第i个自变量x距离第j个样本点的距离
for i=1:length(x1)%计算dis1（i，j）
    for j=1:10
        dis1(i,j)=abs(x1(i)-train(j,7));
    end
end
%p=Pn(x1,dis1,k);%求解每个自变量的概率密度
%plot(x1,p,'b');hold on;%绘制自变量的概率密度曲线图

%二维的情况
a=-4:0.01:4;
b=-4:0.01:4;
x2=zeros(length(a)*length(b),2);%自变量x的取值范围
for i=1:length(a)
    for j=1:length(b)
        x2((i-1)*length(a)+j,1)=a(i);
        x2((i-1)*length(a)+j,2)=b(j);
    end
end
dis2=zeros(length(x2),10);%dis2（i，j）代表第i个自变量x距离第j个样本点的距离
for i=1:length(x2)
    for j=1:10
        dis2(i,j)=sqrt((x2(i,1:2)-train(j,4:5))*(x2(i,1:2)-train(j,4:5)).');%计算dis2（i，j）
    end
end
p=Pn(x2,dis2,k);%求解每个自变量的概率密度
cx=-4:0.01:4;
cy=-4:0.01:4;
cz=griddata(x2(:,1),x2(:,2),p(:,1),cx,cy','cubic');
meshz(cx,cy,cz)%绘制自变量的概率密度曲线图

%二维的情况
x3=[-0.41,0.82,0.88;0.14,0.72,4.1;-0.81,0.61,-0.38];%自变量x的取值
dis3=zeros(3,10);%dis3（i，j）代表第i个自变量x距离类别1中第j个样本点的距离
dis4=zeros(3,10);%dis4（i，j）代表第i个自变量x距离类别2中第j个样本点的距离
dis5=zeros(3,10);%dis5（i，j）代表第i个自变量x距离类别3中第j个样本点的距离
for i=1:3
    for j=1:10
        dis3(i,j)=sqrt((x3(i,:)-train(j,1:3))*(x3(i,:)-train(j,1:3)).');%计算dis1（i，j）
        dis4(i,j)=sqrt((x3(i,:)-train(j,4:6))*(x3(i,:)-train(j,4:6)).');%计算dis2（i，j）
        dis5(i,j)=sqrt((x3(i,:)-train(j,7:9))*(x3(i,:)-train(j,7:9)).');%计算dis3（i，j）
    end
end
%p1=Pn(x3,dis3,k);%计算3个测试点在类别1样本点中的概率密度
%p2=Pn(x3,dis4,k);%计算3个测试点在类别2样本点中的概率密度
%p3=Pn(x3,dis5,k);%计算3个测试点在类别3样本点中的概率密度