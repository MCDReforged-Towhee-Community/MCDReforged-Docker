# https://stackoverflow.com/questions/51121875/how-to-run-docker-with-python-and-java
# 1. Get Linux
FROM ubuntu:latest

# 2. Get Java via the package manager
RUN apk update \
&& apk upgrade \
&& apk add --no-cache bash \
&& apk add --no-cache --virtual=build-dependencies unzip \
&& apk add --no-cache curl \
&& apk add --no-cache openjdk8-jre

### 3. Get Python, PIP
RUN apk add --no-cache python3 \
&& python3 -m ensurepip \
&& pip3 install --upgrade pip setuptools

### Setup MCDR
WORKDIR /mcdreforged
COPY ./requirements.txt /mcdreforged

RUN pip install -r requirements.txt

ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 0

CMD python -m mcdreforged
