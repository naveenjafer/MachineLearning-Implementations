function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

m = size(X, 1); % Number of training examples


p = zeros(m, 1);



predictans=X*theta;
predictans=1+exp(-predictans);
predictans=1./predictans;

for i=1:m
    if(predictans(i)>=0.5)
        p(i)=1;
    else
        p(i)=0;
    end
end


end
