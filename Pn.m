function p=Pn(x,dis,k)
if k~=1%���k��Ϊ1 
    for i=1:k-1
        [~,index]=min(dis,[],2);
        for j=1:length(x)
            dis(j,index(j,1))=100000;%����disÿһ�е�ǰk-1����Сֵ��Ϊ10000
        end
    end
end

h=4*pi/3;
p=zeros(length(x),1);
[min_dis1,~]=min(dis,[],2);%min_dis1Ϊ����disÿһ�еĵ�kС��ֵ��ɵ�������
for i=1:length(x)
    %p(i,1)=k/(20*min_dis1(i,1));
    p(i,1)=k/(10*pi*min_dis1(i,1)*min_dis1(i,1));
    %p(i,1)=k/(10*h*min_dis1(i,1)*min_dis1(i,1)*min_dis1(i,1));%p��i��1��Ϊ��i���Ա����ĸ����ܶ�
end
%plot(x,p,'b') ;hold on;
end