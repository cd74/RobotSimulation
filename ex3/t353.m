tmp1=[1,0,0,0,0,0,0,0,0,0,0,0,0,0;0,1,0,0,0,0,0,0,0,0,0,0,0,0;0,0,0.500000000000000,0,0,0,0,0,0,0,0,0,0,0;-0.125000000000000,-0.250000000000000,-0.250000000000000,0.125000000000000,0,0,0,0,0,0,0,0,0,0;0,0,0,0,1,0,0,0,0,0,0,0,0,0;-1.50000000000000,-2,-1,1.50000000000000,0,-1,0,0,0,0,0,0,0,0;-0.750000000000000,-1.50000000000000,-1,0.750000000000000,-3.46944695195361e-18,0,-0.500000000000000,3.46944695195361e-18,3.70074341541719e-17,-1.38777878078145e-17,1.38777878078145e-17,-3.70074341541719e-17,8.32667268468867e-17,-6.93889390390723e-17;1.12500000000000,1.87500000000000,1.12500000000000,-1.12500000000000,-0.156250000000000,0.375000000000000,0.375000000000000,0.156250000000000,0.333333333333334,-0.250000000000000,0.125000000000000,-0.333333333333334,0.750000000000001,-0.625000000000001;-0.328125000000000,-0.531250000000000,-0.312500000000000,0.328125000000000,0.0585937500000000,-0.125000000000000,-0.0937500000000000,-0.0585937500000000,-0.151041666666667,0.109375000000000,-0.0625000000000001,0.151041666666667,-0.343750000000000,0.289062500000000;0.0292968750000000,0.0468750000000000,0.0273437500000000,-0.0292968750000000,-0.00585937500000001,0.0117187500000000,0.00781250000000001,0.00585937500000001,0.0169270833333333,-0.0117187500000000,0.00781250000000001,-0.0169270833333333,0.0390625000000000,-0.0332031250000000;0,0,0,0,0,0,0,0,1,0,0,0,0,0;0,0,0,0,0,0,0,0,-1.00000000000000,0,0,1.00000000000000,-2.00000000000000,1.50000000000000;0,0,0,0,0,0,0,0,0.333333333333333,0,0,-0.333333333333333,1.00000000000000,-1.00000000000000;0,0,0,0,0,0,0,0,-0.0370370370370370,0,0,0.0370370370370370,-0.111111111111111,0.166666666666667];
%tmp1为M矩阵的逆
for i=1:6
    a(:,i)=tmp1*[r(1,i);0;0;r(2,i);r(2,i);0;0;r(3,i);r(3,i);0;0;r(4,i);0;0]; %计算多项式轨迹的参数
end
for i=1:6
    for j=0:1:19 %第一段
        ftraj(j+1,i)=[1,j/10,0.01*j^2,0.001*j^3]*a(1:4,i);  %计算位移
        fd(j+1,i)=[1,0.2*j,0.03*j^2]*a(2:4,i);  %计算速度
        fdd(j+1,i)=[2,0.6*j]*a(3:4,i);     %计算加速度
    end
    for j=0:0.1:3.9  %第二段
        ftraj(21+10*j,i)=[1,j,j^2,j^3,j^4,j^5]*a(5:10,i);
        fd(10*j+21,i)=[1,2*j,3*j^2,4*j^3,5*j^4]*a(6:10,i);
        fdd(10*j+21,i)=[2,6*j,12*j^2,20*j^3]*a(7:10,i);
    end
    for j=0:0.1:3  %第三段
        ftraj(61+10*j,i)=[1,j,j^2,j^3]*a(11:14,i);
        fd(10*j+61,i)=[1,2*j,3*j^2]*a(12:14,i);
        fdd(10*j+61,i)=[2,6*j]*a(13:14,i);
    end
end
for i=1:3
    x=1:91;
    figure(10);
    subplot(3,3,3*i-2);
    plot(x,ftraj(x,i)); %画图像
    subplot(3,3,3*i-1);
    plot(x,fd(x,i));
    subplot(3,3,3*i);
    plot(x,fdd(x,i));
end
for i=4:6
    x=1:91;
    figure(20);
    subplot(3,3,3*i-11);
    plot(x,ftraj(x,i)); %画图像
    subplot(3,3,3*i-10);
    plot(x,fd(x,i));
    subplot(3,3,3*i-9);
    plot(x,fdd(x,i));
end
figure(5602);
p560.plot(ftraj);
