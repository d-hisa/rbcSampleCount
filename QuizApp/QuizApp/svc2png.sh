for file in $(ls *.svg)
do
    newfile=`echo $file | sed 's/svg/png/'`
    convert -density 128x128 -background none $file $newfile
    echo $newfile
done
