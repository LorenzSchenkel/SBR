#!/bin/bash

TMP=$(mktemp -d)
NPROC=$(nproc)
BUILD=${TMP}/build
mkdir $BUILD

Departments=('OTHR' 'FakA' 'FakAM' 'FakB' 'FakBW' 'FakEI' 'FakIM' 'FakM' 'FakS' 'ZWW' 'RSDS')
DefaultDepartment='OTHR'

function run_build {
  find $TMP -type f -name "*.tex" -print0 | \
    xargs -0 -P $NPROC -I {} \
      sh -c 'pdflatex -output-directory=$2 $1 2>&1 > /dev/null || echo "Compilation Error: `basename $1`"' \
	    -- {} $BUILD
}

function run_bibtex {
  # Bibtex sucks, so we have to pushd
  pushd $BUILD > /dev/null
  find -type f -name "*.aux" -print0 | \
    xargs -0 -P $NPROC -I {} \
	  sh -c 'bibtex $1 2>&1 > /dev/null || echo "Bibtex Error: $1"' \
	    -- $(basename {})
  popd > /dev/null
}


# kidnap wild animals to temporary cages
cp einBaer.jpg $TMP

for department in "${Departments[@]}"; do
	cat Praesentation.tex | sed -e "s/\\\usetheme\[department=[A-Za-z]*/\\\usetheme\[department=${department}/" > ${TMP}/${department}_Praesentation.tex
done

run_build
run_bibtex
run_build
run_build

rm -r examples
mkdir examples

cp ${BUILD}/*.pdf examples/

rm -r $TMP
