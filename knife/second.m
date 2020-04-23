mdl_puma560;
t = (0:0.5:10)'; 
count = length(t);
center = [0.2 0.2 0.2];
radius = 1;
theta = t*(2*pi/t(end));
points =(center + radius*[cos(theta) sin(theta) zeros(size(theta))]);
path=[0.1 0.1 0.3
    0.1 0.2 0.3
    0.2 0.2 0.3
    0.2 0.1 0.3
    0.1 0.1 0.3
    ];
m=mstraj(path, [10 10 10], [], [2 2 2], 0.02, 0.01);
Tm = transl(0.1 * m);
Tm = homtrans( transl(0.4, 0, 0), Tm);
p560.tool = trotx(pi); 
qi = p560.ikine6s(Tm);
p560.plot(qi)
figure
hold on
plot3(points(:,1), points(:,2), points(:,3), 'color', 'k', 'Linewidth', 2);
figure;
p = mstraj(points, [10 10 10], [], [2 2 2], 0.02, 0.01);
Tp = transl(0.1 * p);
Tp = homtrans( transl(0.4, 0, 0), Tp);
p560.tool = trotx(pi); %考虑姿态，保证z轴向下
q = p560.ikine6s(Tp);
p560.plot(q)
