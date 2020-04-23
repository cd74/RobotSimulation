本文件夹中，
descpart.m进行了xyz直角坐标机器人的建立及方形圆形路径规划，
p560part.m进行了puma560的建立及方形圆形路径规划，
knife.m为2-DOF水刀的运动学正解，
iknife.m为2-DOF水刀的运动学逆解，
wk_desc.m需要事先运行descpart.m，它将xyz直角坐标机器人和2-DOF水刀进行组合，并完成了运动矩阵的串联以及运动仿真
wk_p560.m需要事先运行p560part.m，它将p560和2-DOF水刀进行组合，并完成了运动矩阵的串联以及运动仿真
second.m为实现p560路径规划的第二方案