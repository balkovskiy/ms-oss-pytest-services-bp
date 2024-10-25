ARG WRKDIR=/action

FROM python:3.11 AS builder
ARG WRKDIR
ADD . $WRKDIR
WORKDIR $WRKDIR
RUN pip install --upgrade pip
RUN #pip install -r requirements.txt --target=$WRKDIR

FROM gcr.io/distroless/python3-debian11
ARG WRKDIR
COPY --from=builder $WRKDIR $WRKDIR
WORKDIR $WRKDIR
ENV PYTHONPATH=${WRKDIR}

# TODO: Move these variables to secrets
#ENV CONFIG_PATH="${WRKDIR}/config.yml"
#ENV API_URL_STAGE="https://ms-oss-pytest-services-staging.digitalpfizer.com/api/v1"
#ENV API_URL="https://ms-oss-pytest-services-production.digitalpfizer.com/api/v1"
#ENV HAT_TOKEN="m9xyCJKHQrZODF6aypwstR/aqe8r9P6IO-32rhpcamcQ3esgWhzEXSaag8dYtwNL!JecagZ/NSc2c?2WQ!9YotGAO=X=wZ9lGY?YrKkL=m70ZqbN6kPP0xi2WRdf49BF"


CMD ["/action/main.py"]
