% checking derivatives with first-order finite differences
close all; clear all; clear; clc;
h = 1e-6;
m = 10;
for k = 1:20
    x0 = 2*rand(1,m)-1;
    [f0,df] = wingweight(x0);
    df_fd = zeros(m,1);
    for i=1:m
        e = zeros(1,m); e(i) = 1;
        [step,~] = wingweight(x0+h*e);
        df_fd(i) = (step - f0)/h;
    end
    fprintf('WINGWEIGHT: Norm of fd error: %8.6e\n',norm(df-df_fd));
end