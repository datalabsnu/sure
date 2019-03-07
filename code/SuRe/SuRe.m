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


function [cvec, T] = SuRe(A, s, o, P, N, b, eta, lambda, Tolerance, epsilon, niter)
% SuRe : Learn the restart vector
%
% Parameters
%	A : adjacency matrix
%	s : query node index
%	o : origin vector
%	P : positive set
%	N : negative set
%	b : width of loss function
%	eta : learning rate
%	lambda : regularization parameter
%	Tolerence: error tolerance of cvec
%	epsilon : error tolerance of RWER
%	niter: maximum number of iterations
% Return values
%	cvec : the learned restart vector
%	T : number of iterations to convergence
%


if nargin < 1
    niter = 100;
end

n = size(A, 1);
T = 1;
nA = Normalize(A);
cvec = rand(n,1);

while true
    [r,~] = calRWER(nA, s, cvec, epsilon);

    p_tilde = zeros(n,1);
    r_n = r(N);
    r_p = r(P);
    for i=1:length(P)
        p_tilde(P(i)) = - sum( arrayfun(@(x) deriv_logistic(x, b), r_n - r_p(i)));      
    end
    
    for i=1:length(N)
        p_tilde(N(i)) = sum( arrayfun(@(x) deriv_logistic(x, b), r_n(i) - r_p));     
    end
    
    dF = caldrdc(nA, r, s, p_tilde, cvec, epsilon) + lambda * 2 * (cvec - o);
    
    ncvec = cvec - eta * dF;
    ncvec(cvec <= 0) = 0;
    ncvec(cvec >= 1) = 1 - 1e-2;
    
    diff_cvec = norm(abs(ncvec - cvec),1);
    cvec = ncvec;
    if diff_cvec < Tolerance
    	break
    end

    T = T + 1;
    if T > niter
        break
    end 
    
end

end

