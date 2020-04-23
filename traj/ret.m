for i=1:6
    c(:,i)=m1*[r(6,i);0;0;r(5,i);r(1,i);0;0]; %计算返回的轨迹参数（6次）
end
for i=1:6
    for j=0:1:30 
        t=j/10;
        ftraj3(j+1,i)=[1,t,t^2,t^3,t^4,t^5,t^6]*c(1:7,i);  %计算位移
        fd3(j+1,i)=[1,2*t,3*t^2,4*t^3,5*t^4,6*t^5]*c(2:7,i);  %计算速度
        fdd3(j+1,i)=[2,6*t,12*t^2,20*t^3,30*t^4,]*c(3:7,i);     %计算加速度
    end
end
for i=1:3
    x=1:31;
    figure(10);
    subplot(3,3,3*i-2);
    plot(x,ftraj3(x,i)); %画图像
    subplot(3,3,3*i-1);
    plot(x,fd3(x,i));
    subplot(3,3,3*i);
    plot(x,fdd3(x,i));
end
for i=4:6
    x=1:31;
    figure(20);
    subplot(3,3,3*i-11);
    plot(x,ftraj3(x,i)); %画图像
    subplot(3,3,3*i-10);
    plot(x,fd3(x,i));
    subplot(3,3,3*i-9);
    plot(x,fdd3(x,i));
end
figure(5603);
p560.plot(ftraj3,'trail',{'r', 'LineWidth', 3});
pause;
p560.plot([ftraj1;ftraj2;ftraj3],'trail',{'r', 'LineWidth', 2});%全部轨迹