function [beta,theta]=iknife(zy,zx)
nz=1/sqrt(1+tan(zy)*tan(zy)+tan(zx)*tan(zx));
t=acos((nz-0.5)*2);
syms b;
b=solve(cos(b)/2 - (cos(b)*cos(t))/2 + (2^(1/2)*sin(b)*sin(t))/2==tan(zy)*nz,b);
l=0;
beta=eval(b);
[tmp1,tmp2]=knife(beta(1),t);
if(abs(tmp1-beta(1))<0.1 && abs(tmp2-beta(2))<0.1)
    beta=beta(1);
else
    beta=beta(2);
end
theta=t;


