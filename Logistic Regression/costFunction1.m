function [J, grad] = costFunction1(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%  
m = length(y); % number of training examples


J = 0;
grad = zeros(size(theta));


% Note: grad should have the same dimensions as theta

predictans=-X*theta; predictans=1+exp(predictans);
predictans=1./predictans;

for i=1:m
    J=J+y(i,1)*log(predictans(i,1))+(1-y(i,1))*log(abs(1-predictans(i,1)));
end
J=-J/m;

%{
alpha=0.1;
no_of_iters=1000;
thetatemp=theta;
for i=1: no_of_iters
    predictans=-X*theta; predictans=1+exp(predictans);
    predictans=1./predictans;
    errors=predictans-y;
    
    for j=1:size(X,2)
         thetachange=errors.*X(:,j);
         thetachange=sum(thetachange)/m;
         thetatemp(j,1)=thetatemp(j,1)-alpha*thetachange;
    end
theta=thetatemp;
end
%}


    
     predictans=-X*theta; predictans=1+exp(predictans);
    predictans=1./predictans;
    errors=predictans-y;
    
    grad=(X'*errors)/m;
   

end
