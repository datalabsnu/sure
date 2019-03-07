%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Supervised and Extended Restart in Random Walks for Ranking and Link Prediction in Networks
%   
%   Authors: Woojeong Jin (woojung211@snu.ac.kr), Seoul National University
%            Jinhong Jung (jinhongjung@snu.ac.kr), Seoul National University
%            U Kang (ukang@snu.ac.kr), Seoul National University
%   
%   Version : 1.0
%   Date: 2017-10-14
%   Main contact: Woojeong Jin
%
%   This software is free of charge under research purposes.
%   For commercial purposes, please contact the author.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function result = logistic(x, b)
% logistic : calculate the logistic function
%
% Parameters
% 	x : variable
%	b : width of the logistic function
% Return values
%	result : value of the logistic function
%


result = 1 / (1 + exp(-x / b));

end
