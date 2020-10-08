# https://medium.com/bettercode/how-to-build-a-modern-ci-cd-pipeline-5faa01891a5b
FROM alpine:3.5
RUN apk add --update python py-pip
COPY requirements.txt /src/requirements.txt
RUN pip install -r /src/requirements.txt
COPY app.py /src
COPY buzz /src/buzz
CMD python /src/app.py