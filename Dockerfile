FROM python:3.11 AS builder

ARG WRKDIR
ADD . $WRKDIR
WORKDIR $WRKDIR

RUN pip install --upgrade pip
RUN pip install -r requirements.txt --target=$WRKDIR

# Определяем аргументы сборки
ARG VERSION
ARG PROJECT_NAME

ENV MY_VERSION=${VERSION}
ENV MY_PROJECT_NAME=${PROJECT_NAME}

CMD ["/action/main.py"]
