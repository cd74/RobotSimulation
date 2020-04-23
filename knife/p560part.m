mdl_puma560
%画正方形
corC=zeros(4,6);
corC(1,:)=p560.ikine6s(transl(0.11,0.11,0.3)*trotx(pi));
corC(2,:)=p560.ikine6s(transl(0.11,0.58,0.3)*trotx(pi));
corC(3,:)=p560.ikine6s(transl(0.58,0.58,0.3)*trotx(pi));
corC(4,:)=p560.ikine6s(transl(0.58,0.11,0.3)*trotx(pi));
pathC=zeros(50,6);
pathC(1:10,:)=jtraj(p560.qr,corC(1,:),[1:10]);
pathC(11:20,:)=jtraj(corC(1,:),corC(2,:),[1:10]);
pathC(21:30,:)=jtraj(corC(2,:),corC(3,:),[1:10]);
pathC(31:40,:)=jtraj(corC(3,:),corC(4,:),[1:10]);
pathC(41:50,:)=jtraj(corC(4,:),corC(1,:),[1:10]);
p560.plot(pathC)
pause
%画圆形
corD=zeros(90,6);
for i=1:1:90
    corD(i,:)=p560.ikine6s(transl(0.35+0.15*sin(i*pi/45),0.35+0.15*cos(i*pi/45),0.3)*trotx(pi));
end
pathD=zeros(100,6);
pathD(1:10,:)=jtraj(p560.qr,corD(1,:),[1:10]);
pathD(11:99,:)=corD(2:90,:);
pathD(100,:)=corD(1,:);
p560.plot(pathD)
clear i corC corD qz qr qn qs deg