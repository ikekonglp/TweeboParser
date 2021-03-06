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

# This script runs the whole pipeline of TweeboParser. It should install the 
# TurboParser inside the TweeboParser for you.

ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARSER_DIR="${ROOT_DIR}/TBParser"

read -p "Have you downloaded pretrained models? If this your first time installing TweeboParser, please enter no for this. If you have downloaded the pretrained models PROPERLY, and you want to skip this step to save time, please enter yes. If you are not sure what to do, please enter no. [y/n]: " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
echo "Skip the download of pretrained models."
else
rm pretrained_models.tar.gz
curl "http://www.cs.cmu.edu/~ark/TweetNLP/pretrained_models.tar.gz" -o "pretrained_models.tar.gz"
tar xvf pretrained_models.tar.gz
fi

cd ${PARSER_DIR}
chmod +x install-sh
./install_deps.sh
./configure && make && make install
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:`pwd;`/deps/local/lib:"
