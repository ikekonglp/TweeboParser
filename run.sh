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


# This script runs the whole pipeline of TweeboParser. It reads from a raw text input
# and produce the CoNLL format dependency parses as its output (It calls all necessary
# component, such as POS tagger, along the way).

# Get the path of the components of TweeboParser
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPT_DIR="${ROOT_DIR}/scripts"
TAGGER_DIR="${ROOT_DIR}/ark-tweet-nlp-0.3.2"
PARSER_DIR="${ROOT_DIR}/TBParser"
TOKENSEL_DIR="${ROOT_DIR}/token_selection"
MODEL_DIR="${ROOT_DIR}/pretrained_models"
WORKING_DIR="${ROOT_DIR}/working_dir"

# To run the parser:

if [ "$#" -ne 1 ]; then
    echo "Usage: ./run.sh [path_to_raw_input_file_one_sentence_a_line]"
else

# Starting point:
# -- Raw text tweets, one line per tweet.
INPUT_FILE=$1

# --> Run Twitter POS tagger on top of it. (Tokenization and Converting to CoNLL format along the way.)
${SCRIPT_DIR}/tokenize_and_tag.sh ${ROOT_DIR} ${TAGGER_DIR} ${WORKING_DIR} ${MODEL_DIR} ${SCRIPT_DIR} ${INPUT_FILE}

# --> Append Brown Clusters on the end of each word.
python ${SCRIPT_DIR}/AugumentBrownClusteringFeature46.py ${MODEL_DIR}/twitter_brown_clustering_full ${WORKING_DIR}/tagger.out N > ${WORKING_DIR}/tag.br.out
rm ${WORKING_DIR}/tagger.out

# --> Run Token Selection Tool to get the token selections appended on the end of each word.
python ${TOKENSEL_DIR}/pipeline.py ${WORKING_DIR}/tag.br.out ${MODEL_DIR}/tokensel_weights > ${WORKING_DIR}/test
rm ${WORKING_DIR}/tag.br.out


# -- Start Parsing.

cd ${PARSER_DIR}
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:`pwd;`/deps/local/lib:"

# --> Parse the first time using PTB model to get the scores

rm -f -r ${WORKING_DIR}/test_score
mkdir ${WORKING_DIR}/test_score

./TurboParser --test --file_model=${MODEL_DIR}/ptb_parsing_model --file_test=${WORKING_DIR}/test --file_prediction=${WORKING_DIR}/ptb_single_predict_test --output_posterior=true --use_posterior=false --posterior_dir=${WORKING_DIR}/test_score --logtostderr

# --> Parse the second time using PTB score as features to get the final results
./TurboParser --test --file_model=${MODEL_DIR}/parsing_model --file_test=${WORKING_DIR}/test --file_prediction=${WORKING_DIR}/test_predict --output_posterior=false --use_posterior=true --posterior_dir=${WORKING_DIR}/test_score --logtostderr

# -- Output the results.
cd ${ROOT_DIR}
cat ${WORKING_DIR}/test_predict > ${INPUT_FILE}.predict

fi



