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

import sys

def combine(myfile, hisfile, newfile):
    my = open(myfile, 'r')
    his = open(hisfile, 'r')

    newf = open(newfile, 'w')
    while 1:
        myline = my.readline()
        hisline = his.readline()
        if not myline:
            break
        myline = myline.strip()
        hisline = hisline.strip()
        if hisline == '':
            newf.write('\n')
            continue
        myele = myline.split('\t')
        hisele = hisline.split('\t')
        
        newf.write(myline + '\t' + hisele[2] + '\t' + hisele[3] + '\n')

    my.close()
    his.close()
    newf.close()


if __name__ == "__main__":
    combine(sys.argv[1], sys.argv[2], sys.argv[3])
        
