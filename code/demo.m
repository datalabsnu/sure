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

fprintf('load data\n')
load('hepth.mat')

twohop = A * A;
nQ = length(seeds);
predict = cell(nQ, 1);

o = repmat(0.4, n, 1);	% origin vector
b = 1e-2 ;	% width of the WMW loss function
Tolerance = 1e-3;  % gradient descent tolerance
niter = 40;	% maximum number of iterations
lambda = 1;	% regularization parameter
eta = 1e-2;	% learning rate
epsilon = 1e-6; % error tolerance



for sid = 1:length(seeds)
    s = seeds(sid);
    fprintf('seed: %d\n', s);
    P = PosSet{sid};   % positive node set
    N = NegSet{sid};  % negative node set
   
    % learn restart vector
    fprintf('start SuRe\n')
    [cvec, T] = SuRe(A, s, o, P, N, b, eta, lambda, Tolerance, epsilon, niter);
    nA = Normalize(A);
    [r,~] =calRWER(nA, s, cvec,epsilon);

    % evaluation
    answers = sparse(n, 1);
    answers(testlinks{sid}) = 1;
    exclude = [P, N, s];
    testSet  = setdiff(1:n, [find(A(s, :)), exclude]);

    two = find(twohop(s,:));
    testSet = intersect(two, testSet);

    % MAP
    [scores, index] = sort(r(testSet), 'descend');
    predict{sid} = testSet(index);
    

end

MAPscore = meanAveragePrecisionAtK(testlinks, predict, n);
fprintf('MAP: %f\n', MAPscore);


