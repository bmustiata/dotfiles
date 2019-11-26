FROM python:3.6

COPY ./requirements.txt /src/requirements.txt
RUN cd /src && \
    pip install -r requirements.txt

COPY . /src

WORKDIR /src
