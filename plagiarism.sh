n=0
rm -rf output
mkdir output
cd assignments
rm output.txt

for filename in *.zip; do
    ((n++))
    roll=$(echo $filename | awk -F'[_]' '{print $1}')
    echo $roll
    echo $filename
    mkdir ../output/$roll
    unzip -d  "../output/$roll" "./$filename"
    find ../output/$roll -name \*.v   -exec cp {} ../output/$roll/ \; 
done


link1=$( ./moss -d "../output"/**/*.v  | grep -P  "http" )
echo $link1 >>  output.txt

