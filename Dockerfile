FROM python:3.9.2-slim-buster
LABEL maintainer="Jeff Andiorio" email="jeff.andiorio@wwt.com"

RUN apt update && apt -y install git gcc

COPY . /code
WORKDIR /code

RUN pip install -r requirements.txt