function g = sigmoid1(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.
g = zeros(size(z));

g=-1.*z;
g=1+exp(g);
g=1./g;


end
