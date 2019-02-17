FROM python:2.7
LABEL maintainer "Tim Cinel <email@timcinel.com>"

WORKDIR /opt

ADD requirements.txt ./
RUN pip install -r requirements.txt 

ADD km-scrape-usage.py process.sh  ./

ENTRYPOINT [ "/bin/bash", "/opt/process.sh" ]

CMD ["/etc/kogan.conf"]
