FROM python:3.11 AS builder

WORKDIR .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Определяем аргументы сборки
ARG VERSION
ARG PROJECT_NAME

ENV MY_VERSION=${VERSION}
ENV MY_PROJECT_NAME=${PROJECT_NAME}

CMD ["/action/main.py"]
