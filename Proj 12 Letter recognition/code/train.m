%
% 
% function: Solve a Pattern Recognition Problem with a Neural Network
% 
% This script assumes these variables are defined:
%
%   input12 - input data.
%   target650 - target data.

rng('default');

load('input108.mat');   
load('target650.mat');

inputs = input108';
targets = target650';


% Create a Pattern Recognition Network
hiddenLayerSize = 39;
net = patternnet(hiddenLayerSize);

% Choose Input and Output Pre/Post-Processing Functions
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};


% Setup Division of Data for Training, Validation, Testing

net.divideFcn = 'dividerand';  % Divide data randomly
net.divideMode = 'sample';  % Divide up every sample
net.divideParam.trainRatio = 80/100;
net.divideParam.testRatio = 20/100;
net.trainFcn = 'trainscg';  % Scaled conjugate gradient

% Choose a Performance Function
net.performFcn = 'mse';  % Mean squared error

% Choose Plot Functions
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
  'plotregression', 'plotfit'};

net.efficiency.memoryReduction = 100;
net.trainParam.max_fail = 6;
net.trainParam.min_grad=1e-5;
net.trainParam.show=10;
net.trainParam.lr=0.9;
net.trainParam.epochs=1000;
net.trainParam.goal=0.00;


% Train the Network
[net,tr] = train(net,inputs,targets);

% Test the Network
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

% Recalculate Training, Validation and Test Performance
trainTargets = targets .* tr.trainMask{1};
valTargets = targets  .* tr.valMask{1};
testTargets = targets  .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,outputs)
valPerformance = perform(net,valTargets,outputs)
testPerformance = perform(net,testTargets,outputs)

% View the Network
view(net)


disp('after training')
y1 = sim(net,inputs);
y1=abs(y1);
y1=round(y1);

%%save   d:\training_set\net net;
save('net','net')
% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%%%%%%%%figure, plotconfusion(targets,outputs)
%figure, plotroc(targets,outputs)
%figure, ploterrhist(errors)
