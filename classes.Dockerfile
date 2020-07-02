FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get install -y bsdmainutils
RUN apt-get install -y libpq-dev

RUN apt-get install -y git
RUN apt-get install -y python-dev libmysqlclient-dev
RUN apt-get install -y libxml2-dev libxslt1-dev zlib1g-dev

RUN  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tdm/scripts/
COPY classes_task/requirements.txt /tdm/scripts/

# install requirements
RUN pip3 install -r /tdm/scripts/requirements.txt

# Copy the code
COPY celery_tasks /tdm/scripts/celery_tasks/
COPY attendance_task /tdm/scripts/attendance_task/
COPY utils /tdm/scripts/utils/
COPY classes_task /tdm/scripts/classes_task/

RUN mkdir /tdm/logs/
RUN mkdir /tdm/data/

# Set Env variables
ENV CELERY_BROKER_URL amqp://rabbit:5672/
ENV CELERY_RESULT_BACKEND amqp://rabbit:5672/
ENV C_FORCE_ROOT true

WORKDIR /tdm/scripts

ENTRYPOINT celery -A celery_tasks.classes_task worker --loglevel=info -Q classes


