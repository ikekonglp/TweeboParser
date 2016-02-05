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

# /usr/bin/java
import sys

def readf(augfile, normfile):
    aug = open(augfile, "r")
    norm = open(normfile, "r")

    alll = []
    ttp = []
    while True:
        line = aug.readline()
        if not line: 
            break
        line = line.strip()
        if line == "":
            alll.append(ttp)
            ttp = []
            continue
        ele = line.split("\t")
        wd = ele[1]
        pos = ele[3]
        four = ele[10]
        six = ele[11]
        ttp.append(wd+"\t"+pos+"\t"+four+"\t"+six)
    aug.close()

    req_tokens= []
    ttp = []
    while True:
        line = norm.readline()
        if not line:
            break
        line = line.strip()
        if line == "":
            req_tokens.append(ttp)
            ttp = []
            continue
        ele = line.split("\t")
        wd = ele[1]
        ttp.append(wd)
    norm.close()     
   
    return alll, req_tokens


def write_data(newfile, alll, reqd):
    newf = open(newfile, 'w')
    for i in range(len(alll)):
        ann_tweet = alll[i]
        req_tweet = reqd[i]
        for token in ann_tweet:
            wd, pos, four, six = token.split("\t")
            if wd in req_tweet:
                tag = "1"
            else:
                tag = "0"
            #print tag
            newf.write(wd.strip() + "\t" + tag + "\t" + pos.strip() + "\t" + four.strip() + "\t" + six.strip() + "\n")
        #print
        newf.write("\n")
    newf.close()

if __name__ == "__main__":
    # aug_all, normal
    alll, req = readf(sys.argv[1], sys.argv[2])
    write_data(sys.argv[3], alll, req)
