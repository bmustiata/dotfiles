FROM python:3.6

COPY ./requirements.txt /src/requirements.txt
RUN cd /src && \
    pip install -r requirements.txt

COPY . /src

WORKDIR /src

ENV PYTHONPATH=. SERVERMODE=production

EXPOSE 7001

CMD ["uwsgi", "--thunder-lock", "--uid", "101", "--gid", "101", "--gevent", "1000", "--socket", ":7001", "-b", "32768", "--http-websockets", "--wsgi-file", "application.py"]
