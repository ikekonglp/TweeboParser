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

import sys, ast, re

def filter_train_data(filename):
    sents = []
    tags = []
    postagseq = []
    f = open(filename, "r")
    while 1:
        line = f.readline()
        if not line:
            break
        line = line.strip()
        m = ast.literal_eval(line)
        #print m["sent"]
        sentence = m["sent"].split(' ')
        sents.append(sentence)

        posseq = m["pos"]
        postags = []
        postokens = posseq.split(" ")[:-1]
        for token in postokens:
            pos = token[-1]
            postags.append(pos)
            
        anno =  m["anno"]
        l = re.sub('\*\*', '', anno)
        m = re.sub('\\n', ' ', l)
        n = re.sub('[<>(){}]', '', m)
        o = re.sub('[\[\]]', '', n)
        p = re.sub('\$a', '', o)
        q = re.sub('::', '', p)
        s = re.sub('\s+', ' ', q)
        llist = s.split(' ')
        sset = set(llist)
        annotation = list(sset)
        #print ' '.join(annotation)
        yes_no_tags = []
        k = 0
        for item in sentence:
            item = item.strip()
            if item in annotation:
                tag = '1'
            else:
                tag = '0'
            yes_no_tags.append(tag)
            print item+'\t'+tag+'\t'+postags[k]
            k += 1
        tags.append(yes_no_tags)
        print
    f.close
    return sents, tags

if __name__ == "__main__":
    filter_train_data(sys.argv[1])
