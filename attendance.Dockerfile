FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y python3-pip
RUN apt-get install -y bsdmainutils
RUN apt-get install -y dnsutils
RUN apt-get install -y libpq-dev

RUN  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tdm/scripts/

COPY attendance_task/requirements.txt /tdm/scripts/
# install requirements
RUN pip3 install -r /tdm/scripts/requirements.txt

# Copy the code
COPY attendance_task /tdm/scripts/attendance_task/
COPY classes_task /tdm/scripts/classes_task/
COPY celery_tasks /tdm/scripts/celery_tasks/

RUN mkdir /tdm/logs/
RUN mkdir /tdm/data/

# Set Env variables
ENV CELERY_BROKER_URL amqp://rabbit:5672/
ENV CELERY_RESULT_BACKEND amqp://rabbit:5672/
ENV CELERY_CREATE_MISSING_QUEUES true

ENV C_FORCE_ROOT true
ENV PYTHONPATH=$PYTHONPATH:/tdm/scripts/

WORKDIR /tdm/scripts

ENTRYPOINT celery -A celery_tasks.attendance_task worker --loglevel=info -Q attendance
