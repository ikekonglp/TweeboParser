#TweeboParser and Tweebank

We provide a dependency parser for English tweets, TweeboParser . The parser is trained on a subset of a new labeled corpus for 929 tweets (12,318 tokens) drawn from the POS-tagged tweet corpus of Owoputi et al. (2013) , Tweebank .

These were created by Lingpeng Kong, Nathan Schneider, Swabha Swayamdipta, Archna Bhatia, Chris Dyer, and Noah A. Smith.

Thanks to Tweebank annotators: Waleed Ammar, Jason Baldridge, David Bamman, Dallas Card, Shay Cohen, Jesse Dodge, Jeffrey Flanigan, Dan Garrette, Lori Levin, Wang Ling, Bill McDowell, Michael Mordowanec, Brendan O’Connor, Rohan Ramanath, Yanchuan Sim, Liang Sun, Sam Thomson, and Dani Yogatama.

##What TweeboParser does
Given a tweet, TweeboParser predicts its syntactic structure, represented by unlabeled dependencies. Since a tweet often contains more than one utterance, the output of TweeboParser will often be a multi-rooted graph over the tweet. Also, many elements in tweets have no syntactic function. These include, in many cases, hashtags, URLs, and emoticons. TweeboParser tries to exclude these tokens from the parse tree (grayed out in the example below).

Please refer to the paper for more information.

An example of a dependency parse of a tweet is:

![Alt text](http://www.cs.cmu.edu/~ark/TweetNLP/deptree.jpg)

Corresponding CoNLL format representation of the dependency tree above:

```
1       OMG     _       !       !       _       0       _
2       I       _       O       O       _       6       _
3       ♥       _       V       V       _       6       CONJ
4       the     _       D       D       _       5       _
5       Biebs   _       N       N       _       3       _
6       &       _       &       &       _       0       _
7       want    _       V       V       _       6       CONJ
8       to      _       P       P       _       7       _
9       have    _       V       V       _       8       _
10      his     _       D       D       _       11      _
11      babies  _       N       N       _       9       _
12      !       _       ,       ,       _       -1      _
13      —>      _       G       G       _       -1       _
14      LA      _       ^       ^       _       15      MWE
15      Times   _       ^       ^       _       0       _
16      :       _       ,       ,       _       -1      _
17      Teen    _       ^       ^       _       19      _
18      Pop     _       ^       ^       _       19      _
19      Star    _       ^       ^       _       20      _
20      Heartthrob      _       ^       ^       _       21      _
21      is      _       V       V       _       0       _
22      All     _       X       X       _       24      MWE
23      the     _       D       D       _       24      MWE
24      Rage    _       N       N       _       21      _
25      on      _       P       P       _       21      _
26      Social  _       ^       ^       _       27      _
27      Media   _       ^       ^       _       25      _
28      …       _       ,       ,       _       -1      _
29      #belieber       _       #       #       _       -1      _
```
(HEAD = -1 means the word is not included in the tree)

## Further reading:
A Dependency Parser for Tweets 
Lingpeng Kong, Nathan Schneider, Swabha Swayamdipta, Archna Bhatia, Chris Dyer, and Noah A. Smith. In Proceedings of EMNLP 2014.
