FROM --platform=linux/amd64 nginx:stable-alpine

LABEL "tech.pressanykey"="Press Any Key"
LABEL version="1.0"
LABEL description="Dockerfile example."

RUN apk update
RUN apk --no-cache add unzip wget curl

RUN rm -rf /usr/share/nginx/html/index.html 

RUN mkdir /dezip/
WORKDIR /dezip/

RUN curl -LJO https://html5-templates.com/download/wikipedia-template.zip
RUN unzip wikipedia-template.zip

RUN cp -R wikipedia-template/* /usr/share/nginx/html/
