%连接
a7=Link([0,0.5,0,-pi/4]);
a8=Link([0,0,0,pi/4]);
a7.qlim=[0,4*pi];
a8.qlim=[0,4*pi];
knife=SerialLink([a7,a8]);
mybot=SerialLink([desc,knife]);
[beta,theta]=iknife(0.2,0.2);
%正方形
path3=[pathA,zeros(50,1),zeros(50,1)];
for i=11:1:20
    path3(i,4)=beta(1)+pi;
    path3(i,5)=theta(1);
end
for i=21:1:30
    path3(i,4)=beta(1)+pi*3/2;
    path3(i,5)=theta(1);
end
for i=31:1:40
    path3(i,4)=beta(1);
    path3(i,5)=theta(1);
end
for i=41:1:50
    path3(i,4)=beta(1)+pi/2;
    path3(i,5)=theta(1);
end
path3=[path3(1:19,:);jtraj(path3(20,:),path3(21,:),[1:5]);...
    path3(22:29,:);jtraj(path3(30,:),path3(31,:),[1:5]);...
    path3(32:39,:);jtraj(path3(40,:),path3(41,:),[1:5]);...
    path3(42:50,:)];
mybot.plot(path3)
pause
%圆形
path4=[pathB,zeros(100,1),zeros(100,1)];
for i=11:1:100
    path4(i,4)=beta(1)+pi*3/2+(i-11)*pi/45;
    path4(i,5)=theta(1);
end
mybot.plot(path4)