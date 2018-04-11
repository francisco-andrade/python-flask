FROM python/2.7-jessie

COPY app.py /usr/src/app/

WORKDIR /usr/src/app/

EXPOSE 8081/tcp

# ENTRYPOINT ["python"]

# CMD ["app.py"]

# FROM node:7-alpine

# RUN apk add -U subversion
