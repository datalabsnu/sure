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


function dr = caldrdc(nA, r, s, p_tilde, cvec, epsilon)
% caldrdc : calculate dr/dc
%
% Parameters
% 	nA : row-normalized adjacency matrix
%	r : RWER vector (M(:,s) in the paper)
%	s : query node
%	p_tilde : p_tilde vector
%	cvec : restart vector
%	epsilon : error tolerance
% Return values
%	dr : computed dr/dc
%


n = size(nA, 1);
r_tilde = calr_tilde(nA, s, p_tilde, cvec, epsilon);

dr = (-nA*r_tilde + sparse(1:n, s, 1, n, n)*r_tilde) .* r;

end
