for i=1:6  %6个关节角
    for j=0:1:30 %轨迹分成30个点
        t=j/10;
        ftraj1(j+1,i)=[1,t,t^2,t^3,t^4,t^5,t^6]*b(1:7,i);  %计算位置
        fd1(j+1,i)=[1,2*t,3*t^2,4*t^3,5*t^4,6*t^5]*b(2:7,i);  %计算速度
        fdd1(j+1,i)=[2,6*t,12*t^2,20*t^3,30*t^4,]*b(3:7,i);     %计算加速度
    end
end
for i=1:3
    x=1:31;
    figure(10);
    subplot(3,3,3*i-2);
    plot(x,ftraj1(x,i)); %画图像
    subplot(3,3,3*i-1);
    plot(x,fd1(x,i));
    subplot(3,3,3*i);
    plot(x,fdd1(x,i));
end
for i=4:6
    x=1:31;
    figure(20);
    subplot(3,3,3*i-11);
    plot(x,ftraj1(x,i)); %画图像
    subplot(3,3,3*i-10);
    plot(x,fd1(x,i));
    subplot(3,3,3*i-9);
    plot(x,fdd1(x,i));
end
figure(5601);
p560.plot(ftraj1,'trail',{'r', 'LineWidth', 2});