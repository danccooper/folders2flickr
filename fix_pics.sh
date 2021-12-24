/folders2flickr > flikOut 2>&1
grep failed flikOut | awk 'NF>1{print $NF}' > imgsToFix
while read img; do
	exiftool -f -exifversion=0230 -overwrite_original $img
done < imgsToFix
rm flikOut imgsToFix
/folders2flickr
