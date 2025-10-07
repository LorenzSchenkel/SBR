#!/bin/bash

prefix=OTH_R_tex
version=$(git describe --tags 2>/dev/null)

if [[ -z $version ]]; then
	echo No Tags found: generating beta release
#	version="beta-$(date "+%y%m%d%H%M")"
	version="beta_$(git describe --always)_$(date "+%y%m%d%H%M")"
fi

echo Generating Release $version

fullRelease=${prefix}-${version}
studentRelease=${prefix}-students-${version}
overleafPackage=${prefix}-overleaf-${version}

# creating tmp-folder
tmpDir=$(mktemp -d) || { echo "Failed to create temp directory"; exit 1; }
trap "rm -rf $tmpDir" EXIT

mkdir $tmpDir/$prefix

echo copying files for student release...
cp --parents -rt $tmpDir/$prefix Makefile README.md doc/ examples/Praesentation/ examples/Abschlussarbeit/ examples/Projektbericht/ templates/Praesentation/ manuals/ texmf_OTHR/doc/ texmf_OTHR/tex/latex/oth/{beamer,common,logos,Klassen}
rm -rf $tmpDir/$prefix/examples/Praesentation/{build/,generateExamples.sh,Praesentation.txss}

echo packing student release...
#tar caf $studentRelease.tar.bz2 --exclude-vcs -C $tmpDir $prefix
(cd $tmpDir && zip -qr - $prefix -x *.git*) > $studentRelease.zip

echo copying files for full release...
cp --parents -rt $tmpDir/$prefix examples/ templates/ texmf_OTHR/
rm -rf $tmpDir/$prefix/examples/Praesentation/{build/,generateExamples.sh,Praesentation.txss}
rm -rf $tmpDir/$prefix/examples/Testbrief/build/
rm -rf $tmpDir/$prefix/texmf_OTHR/ls-R

echo packing full release...
#tar caf $fullRelease.tar.bz2 --exclude-vcs -C $tmpDir $prefix
(cd $tmpDir && zip -qr - $prefix -x *.git*) > $fullRelease.zip

#using existing temporary full package
echo preparing files for overleaf package...
rm -rf $tmpDir/$prefix/texmf_OTHR/tex/latex/oth/logos/*.eps
cp $tmpDir/$prefix/examples/Abschlussarbeit/Abschlussarbeit.tex $tmpDir/$prefix/Beispiel.tex
echo -e "\$ENV{'TEXINPUTS'}='texmf_OTHR//:' . \$ENV{'TEXINPUTS'};\n\$ENV{'BSTINPUTS'}='texmf_OTHR//:' . \$ENV{'BSTINPUTS'};" > $tmpDir/$prefix/latexmkrc

(cd $tmpDir/$prefix && zip -rq overleaf.zip texmf_OTHR Beispiel.tex latexmkrc)
rm $tmpDir/$prefix/Beispiel.tex
rm -r $tmpDir/$prefix/latexmkrc

echo packing overleaf release...
(cd $tmpDir && zip -qr - $prefix -x *.git*) > $overleafPackage.zip


echo done
