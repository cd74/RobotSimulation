for i=1:6
    for j=0:1:19 %第一段
        ftraj2(j+1,i)=[1,j/10,0.01*j^2,0.001*j^3]*a(1:4,i);  %计算位置
        fd2(j+1,i)=[1,0.2*j,0.03*j^2]*a(2:4,i);  %计算速度
        fdd2(j+1,i)=[2,0.6*j]*a(3:4,i);     %计算加速度
    end
    for j=0:0.1:3.9  %第二段
        ftraj2(21+10*j,i)=[1,j,j^2,j^3,j^4,j^5]*a(5:10,i);
        fd2(10*j+21,i)=[1,2*j,3*j^2,4*j^3,5*j^4]*a(6:10,i);
        fdd2(10*j+21,i)=[2,6*j,12*j^2,20*j^3]*a(7:10,i);
    end
    for j=0:0.1:3  %第三段
        ftraj2(61+10*j,i)=[1,j,j^2,j^3]*a(11:14,i);
        fd2(10*j+61,i)=[1,2*j,3*j^2]*a(12:14,i);
        fdd2(10*j+61,i)=[2,6*j]*a(13:14,i);
    end
end
for i=1:3
    x=1:91;
    figure(10);
    subplot(3,3,3*i-2);
    plot(x,ftraj2(x,i)); %画图像
    subplot(3,3,3*i-1);
    plot(x,fd2(x,i));
    subplot(3,3,3*i);
    plot(x,fdd2(x,i));
end
for i=4:6
    x=1:91;
    figure(20);
    subplot(3,3,3*i-11);
    plot(x,ftraj2(x,i)); %画图像
    subplot(3,3,3*i-10);
    plot(x,fd2(x,i));
    subplot(3,3,3*i-9);
    plot(x,fdd2(x,i));
end
figure(5602);
p560.plot(ftraj2,'trail',{'r', 'LineWidth', 2});
