FROM jazzdd/alpine-flask

COPY app.py /usr/src/app/

WORKDIR /usr/src/app/

EXPOSE 8081/tcp

ENTRYPOINT ["python", "app.py"]

CMD ["app.py"]
