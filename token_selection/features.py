# Copyright (c) 2013-2014 Lingpeng Kong
# All Rights Reserved.
#
# This file is part of TweeboParser 1.0.
#
# TweeboParser 1.0 is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# TweeboParser 1.0 is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with TweeboParser 1.0.  If not, see <http://www.gnu.org/licenses/>.

# Author: Swabha Swayamdipta, Lingpeng Kong

# /usr/bin/python

import sys, re

def extract(word, label, prev, pos, vec1, vec2):
    feats = []
    #prev label
    feats.append('Li-1='+prev+':Li='+label)
    # pos tag
    feats.append('POSi='+pos+':Li='+label)
    # brown cluster 1
    # feats.append('B1i='+vec1+':Li='+label)
    # brown cluster 2
    # feats.append('B2i='+vec2+':Li='+label)

    #is punctuation
    if len(word) == 1 and word.isdigit() == False and word.isalnum() == False:
        feats.append('Pi=TRUE:Li='+label)
    # contains punctuation other than ~
    if len(word) > 1 and re.search('[,.!:\'\"&]', word)!=None:
        feats.append('Qi=TRUE:Li='+label)
    #starts with #
    if word.startswith('#'):
        feats.append('Hi=TRUE:Li='+label)
    #iscapitalized
    if word.istitle():
        feats.append('Ti=TRUE:Li='+label)
    #starts with @
    if word.startswith('@'):
        feats.append('Ai=TRUE:Li='+label)
    # is a link
    if word.startswith('http:'):
        feats.append('Ui=TRUE:Li='+label)
    # contains 'RT'
    if word.startswith('RT'):
        feats.append('Ri=TRUE:Li='+label)
    #print word, '\n', feats
    return feats

def get_all(trainfile):
     train = open(trainfile, 'r')
     feats = set([])
     sents = []
     tagseqs = []
     postagseqs = []
     vecs1 = []
     vecs2 = []
     sent = []
     tags = []
     postags = []
     vec1 = []
     vec2 = []
     while 1:
        line = train.readline()
        if not line:
            break
        line = line.strip()
        if line == "":
            sents.append(sent)
            tagseqs.append(tags)
            postagseqs.append(postags)
            vecs1.append(vec1)
            vecs2.append(vec2)
            sent = []
            tags = []
            postags = []
            vec1 = []
            vec2 = []
            continue
        #word, tag, pos, v1, v2 = line.split("\t")

        cline = line.split("\t")
        word = cline[1].strip()
        tag = cline[13].strip()
        pos = cline[3].strip()
        v1 = cline[10].strip()
        v2 = cline[11].strip()
        #print cline
        #sent.append(word.strip())
        sent.append(cline[1].strip())
        #tags.append(tag.strip())
        tags.append(cline[13].strip())
        #postags.append(pos.strip())
        postags.append(cline[3].strip())
        #vec1.append(v1.strip())
        vec1.append(cline[10].strip())
        #vec2.append(v2.strip())
        vec2.append(cline[11].strip())
        
        
        if len(tags) == 1:
            prev = '*'
        else:
            prev = tags[-2]
        feats.update(extract(word, tag, prev, pos, v1, v2))
     #print feats
     train.close()
     return sents, tagseqs, postagseqs, vecs1, vecs2, list(feats)

if __name__ == "__main__":
    sentset, labelset, postagseqs, vecs1, vecs2, all_feats = get_all(sys.argv[1])
    print sentset[25]
    print labelset[25]
    print len(all_feats)
