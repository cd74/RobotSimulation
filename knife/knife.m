function [zy,zx,pos]=knife(beta,theta)
syms b t;
m1=[cos(b),-sin(b)*sin(pi/4),-sin(b)*sin(pi/4),0;sin(b),sin(pi/4)*cos(b),sin(pi/4)*cos(b),0;0,-sin(pi/4),sqrt(2)/2,-0.5;0,0,0,1];
m2=[cos(t),-sin(t)*sin(pi/4),sin(t)*sin(pi/4),0;sin(t),sin(pi/4)*cos(t),-sin(pi/4)*cos(t),0;0,sin(pi/4),sqrt(2)/2,0;0,0,0,1];
m3=m1*m2;
b=beta;
t=theta;
pos=eval(m3);
zy=atan(pos(2,3)/pos(3,3));
zx=atan(pos(1,3)/pos(3,3));