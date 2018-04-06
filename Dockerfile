FROM jazzdd/alpine-flask

COPY app.py /usr/src/app/

WORKDIR /usr/src/app/

ENTRYPOINT ["python"]

CMD ["app.py"]