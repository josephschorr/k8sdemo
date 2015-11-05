FROM phusion/baseimage
ENV HOME /root
RUN apt-get update
RUN apt-get install -y python-virtualenv python-dev
ADD requirements.txt requirements.txt
RUN virtualenv --distribute venv
RUN venv/bin/pip install -r requirements.txt
ADD helloworld.py helloworld.py
ADD run.sh run.sh
RUN chmod +x run.sh
EXPOSE 5000
CMD ["/bin/bash", "run.sh"]