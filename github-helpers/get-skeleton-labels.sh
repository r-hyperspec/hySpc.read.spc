#!/bin/bash

# get labels from hySpc.skeleton package
curl https://api.github.com/repos/r-hyperspec/hySpc.skeleton/labels |\
grep -ve '\"id\":' - |\
grep -ve '\"node_id\":' - |\
grep -ve '\"url\":' - |\
grep -ve '\"default\":' - > github-helpers/hySpc.skeleton.labels.json
