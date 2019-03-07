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


function r_tilde = calr_tilde(nA, s, p_tilde, cvec, epsilon , niter)
% calr_tilde: calculate r_tilde (sum(M(y,:) - M(x,:)) in the paper) using GMRES
%
% Parameters
%   	nA : row-normalized adjacency matrix
%	s : query node
%	p_tilde : p_tilde vector
%	cvec : restart vector
%	niter: number of iterations
% Return values
%   	r_tilde : sum(M(y,:) - M(x,:))
%


if nargin < 6
    niter = 100;
end

n = size(nA, 1);
q = zeros(n, 1);
q(s) = 1;

AA= speye(n)-(sparse(1:n, 1:n, (1 - cvec), n, n) * nA + sparse((cvec - 1)) * sparse(q')) ;
[r_tilde,~,~,~,~] = gmres(AA,p_tilde,10,epsilon,niter);

end
