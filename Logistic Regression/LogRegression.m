
clear ; close all; clc

%% Load Data
data = xlsread('ml.xlsx');
rows=size(data,1);

for i=1:rows
    if(data(i,60)>1400)
       data(i,60)=1;
    else
        data(i,60)=0;
    end
end
X = data(:, 2:59); y = data(:, 60);


%% ============  Compute Cost and Gradient ============


%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];

% Initialize fitting parameters
initial_theta = zeros(n + 1, 1);

% Compute and display initial cost and gradient
[cost, grad] = costFunction1(initial_theta, X, y);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;




%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction1(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);



%% ============== Predict and Accuracies ==============
%  
% Compute accuracy on our training set
p = predict1(theta, X);
tp=0; fp=0; tn=0; fn=0;
for i=1:rows
    if(p(i)==1&&y(i)==1)
        tp=tp+1;
    elseif(p(i)==0 && y(i)==1)
        fp=fp+1;
    elseif(p(i)==0 && y(i)==0)
        tn=tn+1;
    elseif(p(i)==1 && y(i)==0)
        fn=fn+1;
    end
end   

fprintf('Test Accuracy: %f\n', ((tp+tn)/(tp+tn+fp+fn)) * 100);
fprintf('Test Recall: %f\n', (tp/(tp+fn)) * 100);
fprintf('Test Precision: %f\n', (tp/(tp+fp))* 100);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

