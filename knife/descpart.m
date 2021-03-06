L1=Link([pi/2,0.5,0,pi/2]);
L2=Link([pi/2,0.5,0,pi/2]);
L3=Link([pi/2,0.5,0,-pi/2]);
L1.jointtype='P';
L2.jointtype='P';
L3.jointtype='P';
L1.qlim=[0,3];
L2.qlim=[0,3];
L3.qlim=[0,3];
desc=SerialLink([L1,L2,L3]);
%��������
corA=zeros(4,3);
corA(1,:)=desc.ikcon(transl(0.2,0.2,0.3)*trotx(pi));
corA(2,:)=desc.ikcon(transl(0.2,2.8,0.3)*trotx(pi));
corA(3,:)=desc.ikcon(transl(2.8,2.8,0.3)*trotx(pi));
corA(4,:)=desc.ikcon(transl(2.8,0.2,0.3)*trotx(pi));
pathA=zeros(50,3);
pathA(1:10,:)=jtraj([0.5,0.5,0.5],corA(1,:),[1:10]);
pathA(11:20,:)=jtraj(corA(1,:),corA(2,:),[1:10]);
pathA(21:30,:)=jtraj(corA(2,:),corA(3,:),[1:10]);
pathA(31:40,:)=jtraj(corA(3,:),corA(4,:),[1:10]);
pathA(41:50,:)=jtraj(corA(4,:),corA(1,:),[1:10]);
desc.plot(pathA)
pause
%��Բ��
corB=zeros(90,3);
for i=1:1:90
    corB(i,:)=desc.ikcon(transl(1.5+1.3*sin(i*pi/45),1.5+1.3*cos(i*pi/45),0.3)*trotx(pi));
end
pathB=zeros(100,3);
pathB(1:10,:)=jtraj([0.5,0.5,0.5],corB(1,:),[1:10]);
pathB(11:99,:)=corB(2:90,:);
pathB(100,:)=corB(1,:);
desc.plot(pathB)
clear i corA corB L1 L2 L3