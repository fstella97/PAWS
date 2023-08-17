function y=integrateEOM(init_state,T_total,h)
disp('Integrating EOMs...')

t = 0:h:T_total;

forcing_func = zeros(1,length(init_state)/2);
y = zeros(length(t), length(init_state));
y(1,:) = init_state;

for i=1:(length(t)-1)
    fprintf('%i/%i\r', i, (length(t)-1));
    forcing_func(i,:) = zeros(1,length(init_state)/2);%torque_control_evaluator(y(i,:)); % Control input from Impedance controller
    % RK4 integration step
%     forcing_func(i,:)
    k1 = eom_solver(y(i,:), forcing_func(i,:));
    k2 = eom_solver(y(i,:)+0.5*h*k1, forcing_func(i,:));
    k3 = eom_solver(y(i,:)+0.5*h*k2, forcing_func(i,:));
    k4 = eom_solver(y(i,:)+h*k3, forcing_func(i,:));
    y(i+1,:) = y(i,:) + h/6*(k1+2*k2+2*k3+k4);
    
end