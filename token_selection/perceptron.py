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

#/usr/bin/python

from __future__ import division
import features, sys
from viterbi import execute

step = 1.0
all_labels = ['0', '1']

def init(all_features):
    fmap = {}
    for feat in all_features:
        fmap[feat] = 0.0
        
    return fmap

def run(sentset, labelset, postagseqs, vecs1, vecs2, num_iter, all_feats):
    weights = init(all_feats)
    weights_avg = init(all_feats)

    for i in range(num_iter):
        sys.stderr.write(str(i)+"\r")
        for j in range(len(sentset)):
            sent = sentset[j]
            labelseq = labelset[j]
            postagseq = postagseqs[j]
            vec1 = vecs1[j]
            vec2 = vecs2[j]
            predseq, f = execute(sent, all_labels, postagseq, vec1, vec2, weights)
            if labelseq != predseq:
                update(weights, predseq, labelseq, postagseq, vec1, vec2, sent)
                add_weights(weights_avg, weights)
    for f in weights_avg.iterkeys():
        weights_avg[f] /= num_iter*len(sentset)
        print f, weights_avg[f]
    return weights_avg
        
def update(weights, predseq, labelseq, postagseq, vecs1, vecs2, sent):
    for i in range(len(predseq)):
        true = labelseq[i]
        pred = predseq[i]
        pos = postagseq[i]
        vec1 = vecs1[i]
        vec2 = vecs2[i]
        if i == 0:
            prev_true = '*'
            prev_pred = '*'
        else:
            prev_true = labelseq[i-1]
            prev_pred = predseq[i-1]
        if true != pred:
            
            true_feats = features.extract(sent[i], true, prev_true, pos, vec1, vec2)
            for feat in true_feats:
                if feat in weights:
                    weights[feat] += step
            pred_feats = features.extract(sent[i], pred, prev_pred, pos, vec1, vec2)
            for feat in pred_feats:
                if feat in weights:
                    weights[feat] -= step
    return weights  

def add_weights(wmap1, wmap2):
    for f in wmap1.iterkeys():
        wmap1[f] += wmap2[f]

if __name__ == "__main__":
    #print "start"
    sentset, labelset, postagseqs, vecs1, vecs2, all_feats = features.get_all(sys.argv[1])
    #print labelset
    num_iter = 750
    run(sentset, labelset, postagseqs, vecs1, vecs2, num_iter, all_feats)
