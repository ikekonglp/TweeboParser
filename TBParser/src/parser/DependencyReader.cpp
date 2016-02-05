// Copyright (c) 2012-2013 Andre Martins
// All Rights Reserved.
//
// This file is part of TurboParser 2.1.
//
// TurboParser 2.1 is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// TurboParser 2.1 is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with TurboParser 2.1.  If not, see <http://www.gnu.org/licenses/>.

#include "DependencyReader.h"
#include "Utils.h"
#include <iostream>
#include <sstream>

using namespace std;

DependencyInstance *DependencyReader::GetNext() {
  // Fill all fields for the entire sentence.
  vector<vector<string> > sentence_fields;
  string line;
  if (is_.is_open()) {
    while (!is_.eof()) {
      getline(is_, line);
      if (line.length() <= 0) break;
      vector<string> fields;
      StringSplit(line, "\t", &fields);
      sentence_fields.push_back(fields);
    }
  }

  // Sentence length.
  int length = sentence_fields.size();

  // Convert to array of forms, lemmas, etc.
  // Note: the first token is the root symbol.
  vector<string> forms(length+1);
  vector<string> brownall(length+1);
  vector<string> lemmas(length+1);
  vector<string> cpos(length+1);
  vector<string> brown4(length+1);
  vector<string> brown6(length+1);
  vector<string> pos(length+1);
  vector<vector<string> > feats(length+1);
  vector<string> deprels(length+1);
  vector<int> selects(length+1);
  vector<int> heads(length+1);

  forms[0] = "_root_";
  brownall[0] = "_root_";
  lemmas[0] = "_root_";
  cpos[0] = "_root_";
  brown4[0] = "_root_";
  brown6[0] = "_root_";
  pos[0] = "_root_";
  deprels[0] = "_root_";
  heads[0] = -1;
  feats[0] = vector<string>(1, "_root_");
  // LPK: the root should always be selected, otherwises nothing can be linked to the root
  selects[0] = 1;

  for(int i = 0; i < length; i++) {
    const vector<string> &info = sentence_fields[i];

    // LPK_TODO: If we would like to add an line to the original Conll format -- augmented Conll Format,
    // we would want to read something from here with index longer than 9
    // Also, at the same time, the format of the DependencyInstance should be changed

    forms[i+1] = info[1];
    brownall[i+1] = info[12];
    lemmas[i+1] = info[2];
    cpos[i+1] = info[3];
    brown4[i+1] = info[10];
    brown6[i+1] = info[11];
    pos[i+1] = info[4];

    string feat_seq = info[5];
    if (0 == feat_seq.compare("_")) {
      // LPK: the underline means nothing in this field
      feats[i+1].clear();
    } else {
      // LPK: every field is actually a vector of string even it only has one value inside that
      StringSplit(feat_seq, "|", &feats[i+1]);
    }
    // LPK: save the dependency relation
    deprels[i+1] = info[7];

    // LPK: check the index of the head into the vector heads
    stringstream ss(info[6]);
    ss >> heads[i+1];

    stringstream sss(info[13]);
    //VLOG(2) << "input into select " << info[13];
    sss >> selects[i+1];

  }

  DependencyInstance *instance = NULL;
  if (length > 0) {
    instance = new DependencyInstance;
    instance->Initialize(forms, brownall, lemmas, cpos, brown4, brown6, pos, feats, deprels, heads, selects);
  }

  return instance;
}
