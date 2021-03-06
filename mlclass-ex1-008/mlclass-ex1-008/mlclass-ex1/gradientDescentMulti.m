function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters,1);
features = size(X,2);

for iter = 1:num_iters
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %
    %J = J + ((theta(1)+theta(2).*X(i,2) - y(i)).^2)./(2*m);
    dJdTheta=0;
    for i = 1:m
        U = sum(theta.*X(i,:)') - y(i);
        V = 0;
        for j = 1: features
            V = V+theta(j)*X(i,j);
        end
        V = V - y(i);
%         U = theta(1)+theta(2)*X(i,2) - y(i);
        dJdTheta = dJdTheta + ((1/(m))*(V))*X(i,:)';
%         dJdTheta2 = dJdTheta2 + (1/(m))*(U)*X(i,2);
    end
    
    temp = theta - alpha * dJdTheta;
%     temp0 = theta(1) - alpha * dJdTheta1;
%     temp1 = theta(2) - alpha * dJdTheta2;
    
    theta = temp;

%     if (computeCost(X,y,temp) < computeCost(X,y,theta))
%         theta = temp;
%     else
%         iterationstilconverge = iter;
%         iter = num_iters;
%     end
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
