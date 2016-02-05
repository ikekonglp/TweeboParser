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

#! /usr/bin/python

'''
Featurized Viterbi algorithm
Created on Sep 12, 2013

@author: swabha
'''

from features import extract
from collections import defaultdict


def execute(sentence, labelset, postags, vecs1, vecs2, weights):
    if '*' not in labelset:
        labelset.append('*')
    n = len(sentence)
    pi = []
    bp = []
    fl = []

    #print 'initializing...'
    for i in xrange(0, n+1):
        pi.append(defaultdict())
        bp.append(defaultdict())
        fl.append(defaultdict())
        for label in labelset:
            pi[i][label] = float("-inf")
            bp[i][label] = ""
            fl[i][label] = []
    pi[0]['*'] = 0.0
    
    # print 'main viterbi algorithm ...'
    for k in xrange(1, n+1):
        for u in labelset:
            max_score = float("-inf")
            argmax = '1'
            best_feat = ''
            for w in labelset:
                local_score, feats = get_score(sentence[k-1], u, w, postags[k-1], vecs1[k-1], vecs2[k-1], weights)
                score = pi[k-1][w] + local_score
                if score > max_score:
                    max_score = score
                    argmax = w
                    best_feat = feats
            pi[k][u] = max_score
            bp[k][u] = argmax
            fl[k][u] = best_feat
            
#            for w in labelset:
#                print "{0:.2f}".format(pi[k][w]) + " ",
#            print 
    
    # print "decoding..."
    tags = []
    features =[]
    
    max_score = float("-inf")
    best_last_label = '1'
    best_feat = ''
    for w in labelset:
        local_score = 0.0 #get_score('<STOP>', w, weights)
        
        score = pi[n][w] + local_score
        if score > max_score:
            max_score = score
            best_last_label = w
            best_feat = feats
    tags.append(best_last_label)
    features.extend(best_feat)

    # tag extraction
    
    for k in range(n-1, 0, -1):
        last_tag = tags[len(tags)-1]
        tags.append(bp[k+1][last_tag])
        features.extend(fl[k+1][last_tag])
    
    features.extend(fl[1][tags[len(tags) - 1]])
    tags = list(reversed(tags))
    
    return tags, features

def get_score(word, current_tag, prev_tag, pos, v1, v2, weights):
    score = 0.0
    features_list = extract(word, current_tag, prev_tag, pos, v1, v2)

    for feature in features_list:
        if feature in weights:
            score += weights[feature]

    return score, features_list

