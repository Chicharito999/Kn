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
    %p(i,1)=k/(20*min_dis1(i,1));
    p(i,1)=k/(10*pi*min_dis1(i,1)*min_dis1(i,1));
    %p(i,1)=k/(10*h*min_dis1(i,1)*min_dis1(i,1)*min_dis1(i,1));%p（i，1）为第i个自变量的概率密度
end
%plot(x,p,'b') ;hold on;
end