FROM python:3.11 AS builder

WORKDIR app/
COPY . ./app

# Определяем аргументы сборки
ARG VERSION
ARG PROJECT_NAME

ENV MY_VERSION=${VERSION}
ENV MY_PROJECT_NAME=${PROJECT_NAME}

RUN pip install --upgrade pip
RUN pip install -r requirements.txt --target=./app

CMD ["/app/main.py"]
