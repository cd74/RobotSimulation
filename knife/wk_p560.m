%连接
a7=Link([0,0.5,0,-pi/4]);
a8=Link([0,0,0,pi/4]);
a7.qlim=[0,4*pi];
a8.qlim=[0,4*pi];
knife=SerialLink([a7,a8]);
mybot=SerialLink([p560,knife]);
[beta,theta]=iknife(0.2,0.2);
%正方形
path1=[pathC,zeros(50,1),zeros(50,1)];
for i=11:1:20
    path1(i,7)=beta(1)+pi;
    path1(i,8)=theta(1);
end
for i=21:1:30
    path1(i,7)=beta(1)+pi*3/2;
    path1(i,8)=theta(1);
end
for i=31:1:40
    path1(i,7)=beta(1);
    path1(i,8)=theta(1);
end
for i=41:1:50
    path1(i,7)=beta(1)+pi/2;
    path1(i,8)=theta(1);
end
path1=[path1(1:19,:);jtraj(path1(20,:),path1(21,:),[1:5]);...
    path1(22:29,:);jtraj(path1(30,:),path1(31,:),[1:5]);...
    path1(32:39,:);jtraj(path1(40,:),path1(41,:),[1:5]);...
    path1(42:50,:)];
mybot.plot(path1)
pause
%圆形
path2=[pathD,zeros(100,1),zeros(100,1)];
for i=11:1:100
    path2(i,7)=beta(1)+pi*3/2+(i-11)*pi/45;
    path2(i,8)=theta(1);
end
mybot.plot(path2)