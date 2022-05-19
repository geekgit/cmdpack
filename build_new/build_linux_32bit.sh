#!/bin/bash
gcc_32bit() {
echo "gcc"
gcc -O2 -m32 "$1" -s -o "$2"
chmod a+rwx "$2"
}
echo "$PWD"
cd ..

echo "$PWD"
SourceFiles="*.c"
BuildPath="./build_output/linux_32bit"
mkdir -p "${BuildPath}"
for Source in $SourceFiles
do
	echo "${Source}"
	Filename=$(basename "$Source")
	Extension="${Filename##*.}"
	Plain="${Filename%.*}"
	gcc_32bit "${Source}" "${BuildPath}/${Plain}"
done

cp "${BuildPath}/ecm" "${BuildPath}/unecm"
