FROM jazzdd/alpine-flask

COPY app.py /usr/src/app/

WORKDIR /usr/src/app/

EXPOSE 8081/tcp

RUN python app.py &

# ENTRYPOINT ["python"]

# CMD ["app.py"]

# FROM node:7-alpine

# RUN apk add -U subversion
