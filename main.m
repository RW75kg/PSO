%_________________________________________________________________________%
% 粒子群算法             %
%_________________________________________________________________________%

% 使用方法
%__________________________________________
% fobj = @YourCostFunction        设定适应度函数
% dim = number of your variables   设定维度
% Max_iteration = maximum number of generations 设定最大迭代次数
% SearchAgents_no = number of search agents   种群数量
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n  变量下边界
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n   变量上边界
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run PIO: [Best_pos,Best_score,curve]=PIO(pop,Max_iter,lb,ub,dim,fobj)
%__________________________________________

clear all 
clc
% rng('default');
SearchAgents_no=50; % Number of search agents 种群数量

Function_name='F1'; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper) 设定适应度函数

Max_iteration=1000; % Maximum numbef of iterations 设定最大迭代次数

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);  %设定边界以及优化函数
%速度范围设定
Vmax = 20;
Vmin = - 20;
[Best_pos,Best_score,curve]=PSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj,Vmax,Vmin); %开始优化

figure('Position',[269   240   660   290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

%Draw objective space
subplot(1,2,2);
plot(curve,'Color','r','linewidth',1.5)
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('PSO')

display(['The best solution obtained by PSO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by PSO is : ', num2str(Best_score)]);
