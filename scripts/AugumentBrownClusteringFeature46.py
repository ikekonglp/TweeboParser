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

# Lingpeng Kong, lingpenk@cs.cmu.edu
# Oct 12, 2013
# The Brown Clustering usage for Dependency Parsing can be read from Koo et al (ACL 08)
# http://people.csail.mit.edu/maestro/papers/koo08acl.pdf
# Oct 27, 2013
# Add case-sensitive choice
# Jan 4, 2014
# Add 4 bits, 6 bits and all bits.
# May 24, 2014
# Add codecs to support utf-8

import sys
import codecs

def usage():
    print "Usage: AugumentBrownClusteringFeature.py [Brown_Clustering_Dictionary] " \
          "[Input_Conll_File] [Y/N(case-sensitive)] > [Output_file]"
    print "Example: AugumentBrownClusteringFeature.py paths input.txt > output.txt"
    print "The program will add two kind of Strings at the end, the first one is the first 4 " \
          "bit of the Brown Cluster label and the second one is the whole Brown Cluster label."


if __name__ == "__main__":
    if len(sys.argv) != 4:
        usage()
        sys.exit(2)

    sys.stdout = codecs.getwriter('utf-8')(sys.stdout)
    sys.stderr = codecs.getwriter('utf-8')(sys.stderr)

    brown_dict = dict()
    brown_file = open(sys.argv[1].strip(), "r")
    for line in brown_file:
        line = line.strip()
        if line == "":
            continue
        bl = line.split("\t")
        brown_dict[bl[1]] = bl[0]
    #print brown_dict['upstage/downstage']

    inputf = sys.argv[2].strip()
    for line in codecs.open(inputf, "r", "utf-8"):
        line = line.strip()
        if line == "":
            sys.stdout.write("\n")
            continue
        cvlist = line.split("\t")
	if sys.argv[3] == "N":
            brown = brown_dict.get(cvlist[1].lower().strip(), 'OOV')
        else:
            brown = brown_dict.get(cvlist[1].strip(), 'OOV')
        b4 = brown[:4] if len(brown) >= 4 else brown
        b6 = brown[:6] if len(brown) >= 6 else brown
        cvlist.append(b4)
        cvlist.append(b6)
        cvlist.append(brown)
        tline = ""
        for ele in cvlist:
            tline = tline + ele + "\t"
        tline = tline[:len(tline) - 1]
        print tline
