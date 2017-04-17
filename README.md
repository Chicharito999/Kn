# Kn近邻估计
:point_down::fu:Kn近邻估计<br>
__________________________________________________________________________________________
Author:赵明福                                        Student ID：201400301087                            E-mail:1109646702@qq.com<br>
## 题目介绍
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片33.png)
## 题目分析
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片34.png)<br>
## 编程实现及注释
“Kn”<br>
```matlab
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
```
“Pn”<br>
```matlab
function p=Pn(x,dis,k)
if k~=1%如果k不为1 
    for i=1:k-1
        [~,index]=min(dis,[],2);
        for j=1:length(x)
            dis(j,index(j,1))=100000;%矩阵dis每一行的前k-1个最小值设为10000
        end
    end
end
 
h=4*pi/3;
p=zeros(length(x),1);
[min_dis1,~]=min(dis,[],2);%min_dis1为矩阵dis每一行的第k小的值组成的列向量
for i=1:length(x)
    %p(i,1)=k/(10*min_dis1(i,1));
     p(i,1)=k/(10*pi*min_dis1(i,1)*min_dis1(i,1));
    %p(i,1)=k/(10*h*min_dis1(i,1)*min_dis1(i,1)*min_dis1(i,1));%p（i，1）为第i个自变量的概率密度
end
%plot(x,p,'b') ;hold on;
end
```
## 结果分析
对于一维的情况，k=1时：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片35.png)<br>
K=3时：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片36.png)<br>
K=5时：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片37.png)<br>
对于一维概率密度函数的近邻估计结果：可以看出估计出的斜率并非是连续的，不连续性通常发生在离开样本点的位置。而且选择不同的k值得到的概率密度曲线也不相同，当k=1时，每个点的概率取值完全取决于离它最近的点的距离，所以导致在样本点附近形成尖峰。同时这种情况随着k的增加而有所改善，然而在没有更多信息的情况下，并没有特别好的k值。<br>
对于二维的情况，k=1时：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片38.png)<br>
k=3时：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片39.png)<br>
k=5时：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片40.png)<br>
对于二维概率密度函数的近邻估计结果：可以看出利用有限个样本点估计出的密度相当崎岖，存在斜率上的不连续处，而且不连续处通常在样本点处。而且选择不同的k值得到的概率密度曲面也不相同，当k=1时，每个点的概率取值完全取决于离它最近的点的距离，所以导致在样本点附近形成尖峰。同时这种情况随着k的增加而有所改善，然而在没有更多信息的情况下，并没有特别好的k值。<br>
对于三维的情况，3个测试点分别在类别1、2、3样本点中的概率密度：<br>
![](https://github.com/Chicharito999/ImageCache/raw/master/image/图片41.png)<br>
 
