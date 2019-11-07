% Gaussian Highpass Filter
% 
% Author: Wu Jiangnan 2019/4/5
% 

function [ Hd ] = GaussLPF( input,D)

%  input  : image in 'double' data type , 2 dimensions
%  D : Gaussian end frequency 
%           range is [0,1] ( normalized )

Hd_low=GaussLPF(input,D);
Hd=ones(size(Hd_low))-Hd_low;

end