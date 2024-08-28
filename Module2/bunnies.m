% How many bunnies at time t?

% n - number of months
% x(n) - size of population 

nParam = 1000; % number of r values

K = 0.6; % carrying capacity
rArray = linspace(0.1,2.99,nParam); % growth

x = zeros(1,nMax); % number of months
x(1) = 0.2; % starting population
nMax = 1000; % maximum number of months
final_n = zeros(nParam, 300); % matrix for N-state values

for param=1:nParam
    
    % model parameters
    r = rArray(param);
    K = 0.6;
   
    x = zeros(1,nMax);
    
    % initial condition
    x(1) = 0.5;

    for n=1:nMax
     
        x(n+1) = x(n) + r*(1-(x(n)/K))*x(n);
        %x(n) = x(n-1) - 1/N*x(n-1);
    end    
    
    final_n(param,:) = x((end-size(final_n,2)+1):end);
    
end % finished loop through days

% THE MODEL ^
% ------------------------------------------
% THE BEHAVIOR / THE OUTPUT ? 

figure(1); 
plot(final_n,'-ob');
ylabel('Pop Size')
xlabel('Growth rate per capita')