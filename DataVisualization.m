T = readtable('data_for_visualization.csv', 'PreserveVariableNames',true);
x = -30:.1:80; % Temperature Axis
y = -5:.1:5; %Voltagey Axis
[X, Y] = meshgrid(x,y); %// all combinations of x, y
Z = 0;
for i = 1:1:height(T)
    mu = [T.TemperatureMean(i), T.VoltageMean(i)];
    sigma = [(T.TemperatureSigma(i) * 1) 0; 0 (T.VoltageSigma(i))];
    Z = Z + mvnpdf([X(:) Y(:)],mu,sigma)*T.Weight(i); %// compute Gaussian pdf
end
Z = reshape(Z,size(X)); %// put into same size as X, Y
figure(1)
surf(X,Y,Z)
set ( gca, 'ydir', 'reverse' )
xlabel('Temperature (°C)') 
ylabel('Voltage (V)')
figure(2)
contour(Y,X,Z,'LevelList',10:10:200), axis equal
ylabel('Temperature (°C)') 
xlabel('Voltage (V)')