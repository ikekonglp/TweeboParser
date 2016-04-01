##NEWS
```
April 1, 2016 -- We support both Python2 and Python3 now! 
                 Big thanks to Nikhil Kini (https://nikhilnkini.wordpress.com/) who figured this out!
Feb 5, 2016 -- Changing to c++11, we support both Ubuntu and MacOS now!
```
##TweeboParser and Tweebank

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



##Compiling

```
Note: You will need the latest GCC, cmake, Java, Python to install and run this software.
If you get into any problem, please send an email to lingpenk@cs.cmu.edu
with the log from the command "./install.sh" and "./run.sh sample_input.txt" so that we can help.
```

To compile the code, git clone the repository first 

```
> git clone https://github.com/ikekonglp/TweeboParser.git
> cd TweeboParser
```

Next, run the following command

```
> ./install.sh
```

This will install TweeboParser and all its dependencies. Also, it will download the pretrained models for you. They are stored at http://www.cs.cmu.edu/~ark/TweetNLP/pretrained_models.tar.gz

##Example of usage

To run the TweeboParser on raw text input with one sentence per line (e.g. on the
sample_input.txt):

```
> ./run.sh sample_input.txt
```

The run.sh file contains the steps we run the whole TweeboParser pipeline, including
twokenization, POS tagging, appending brown clustering features and PTB features etc.

The output file will be "sample_input.txt.predict" in the same directory as
"sample_input.txt".

which contains the CoNLL format (http://ilk.uvt.nl/conll/#dataformat) output of the
parse tree. (HEAD < 0 means the word is not included in the tree)

##Directory Structure
```
ark-tweet-nlp		----	The Twitter POS Tagger (http://www.ark.cs.cmu.edu/TweetNLP/)
pretrained_models	----	Tagging, token selection, brown clusters obtained from
				Owoputi et al. (2012) and pre-trained parsing models for PTB
							and Tweets.
scripts			----	Supporting scripts.
TBParser		----	TweeboParser, which is based on TurboParser version 2.1.0.
							The source code of TweeboParser can be found at TBParser/src
token_selection		----	The token selection tool implemented in Python.
Tweebank		----	Tweebank data release.
working_dir		----	The working space for the parser. The temp files generated by
				TweeboParser when parsing a sentence are putted here. (So don't
							remove or rename it.)
run.sh			----	The bash script which runs the parser on raw inputs (see sec. 1.2).
install.sh		----	The bash script which installs everything (see sec. 1.1).
```

##Tweebank

Most of TWEEBANK was built in a day by two dozen annotators, most of whom had only
cursory training in the annotation scheme.
```
Train_Test_Splited	----	The CoNLL format train and test split we use in the paper.
							"Train" and "Test-New" in the paper.

Raw_Data		----	The json format file which contains all the annotation we have.
				(Note that some of them are under-specific in annotation. But We
				only use the ones with the full annotation.)

				The CoNLL format file contains all the full annotated data we
				have, the MWE is pre-processed by first-order TurboParser 
				trained on the Penn Treebank. (See the paper for more details.)
```

## Further reading:
A Dependency Parser for Tweets 
Lingpeng Kong, Nathan Schneider, Swabha Swayamdipta, Archna Bhatia, Chris Dyer, and Noah A. Smith. In Proceedings of EMNLP 2014.
