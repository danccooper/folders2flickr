FROM python:2

RUN apt update && apt install -y exiftool && apt clean

COPY ExifRead-2.3.2.tar.gz f2f-v1.1.tar.gz ./

RUN pip install ExifRead-2.3.2.tar.gz f2f-v1.1.tar.gz
RUN rm ExifRead-2.3.2.tar.gz f2f-v1.1.tar.gz

RUN sed -i 's/base + "upload\/"/"https:\/\/up.flickr.com\/services\/upload\/"/g' /usr/local/lib/python2.7/site-packages/f2flickr/uploadr.py

COPY folders2flickr fix_pics.sh ./
RUN chmod +x folders2flickr fix_pics.sh

ENTRYPOINT ["/bin/bash", "fix_pics.sh"]
