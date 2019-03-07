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


function [r, T] = calRWER( nA, s, cvec, epsilon , niter )
% calRWER: calculate RWER using the iterative method
%
% Parameters
%   	nA : row-normalized adjacency matrix
%	s : query node
%	cvec : restart vector
%	epsilon : error tolerance
%	niter: number of iterations
% Return values
%   	r : RWER score vector w.r.t. seed
%	T : number of iterations
%


if nargin < 5
    niter = 100;
end

T = 1;

n = size(nA, 1);
q = zeros(n, 1);
q(s) = 1;

r = q;

diff = ones(n,1);

% % % for deadend
while norm(diff) > epsilon
    new_r =  nA' * ((1 - cvec) .* r);
    t = sum (new_r);
    new_r = new_r + (1 - t) * q;
    diff = r - new_r;
    r = new_r;
    if T > niter
        break
    end
    T = T + 1;
end
% % % 

% % % Normal
% while norm(diff) > epsilon
%     new_r = nA' * ((1 - cvec) .* r) + (cvec' * r) * q;
%     diff = r - new_r;
%     r = new_r;
%     if T > niter
%         break
%     end
%     T = T + 1;
% end
% % % 
end
