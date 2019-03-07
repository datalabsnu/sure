# Supervised and Extended Restart in Random Walks for Ranking and Link Prediction in Networks

## Overview
Given a real-world graph, how can we measure relevance scores for ranking and link prediction? Random walk with restart (RWR) provides an excellent measure for this and has been applied to various applications such as friend recommendation, community detection, anomaly detection, etc. However, RWR suﬀers from two problems: 1) using the same restart probability for all the nodes limits the expressiveness of random walk, and 2) the restart probability needs to be manually chosen for each application without theoretical justiﬁcation. 

We have two main contributions in this paper. First, we propose Random Walk with Extended Restart (RWER), a random walk based measure which improves the expressiveness of random walks by using a distinct restart probability for each node. The improved expressiveness leads to superior accuracy for ranking and link prediction. Second, we propose SuRe (Supervised Restart for RWER), an algorithm for learning the restart probabilities of RWER from a given graph. SuRe eliminates the need to heuristically and manually select the restart parameter for RWER. Extensive experiments show that our proposed method provides the best performance for ranking and link prediction tasks. 

## Paper
RWER and SuRe are described in the following paper:
* Supervised and Extended Restart in Random Walks for Ranking and Link Prediction in Networks (submitted), Woojeong Jin, Jinhong Jung, and U Kang

## Datasets

The datasets used in this paper are available at `data` folder. 
The detailed information of each dataset is described in the following table.

| Name | # Nodes | # Edges | Description | Source | Location | 
|------|--------:|--------:|-------------|--------|----------|
| Wikipedia | 3,023,165 | 102,382,410 | Hyperlink network | [link](https://dumps.wikimedia.org/) | ./data/edit-frwiki.tar.bz2 |
| HepPh | 34,546 | 421,534 | Collaboration network | [link](http://konect.uni-koblenz.de/networks/ca-cit-HepPh) | cit-HepPh |
| HepTh | 27,770 | 352,768 | Collaboration network | [link](http://konect.uni-koblenz.de/networks/ca-cit-HepTh) | cit-HepTh |
| Polblogs | 1,490 | 19,025	| Political network | [link](http://www-personal.umich.edu/~mejn/netdata/) | polblogs |


## People
* [Woojeong Jin](http://datalab.snu.ac.kr/~woojung) (University of Southern California)
* [Jinhong Jung](http://datalab.snu.ac.kr/~jinhong) (Seoul National University)
* [U Kang](http://datalab.snu.ac.kr/~ukang) (Seoul National University)
