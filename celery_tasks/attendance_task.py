import os
import logging
import logging.config

from attendance_task.attendance import upload_data

from celery import Celery

try:
    from config import LOGGING
except ImportError:
    LOGGING = None

CELERY_BROKER_URL = os.environ.get('CELERY_BROKER_URL', 'pyamqp://rabbit:5672/'),
CELERY_RESULT_BACKEND = os.environ.get('CELERY_RESULT_BACKEND', 'pyamqp://rabbit:5672/')

celery = Celery('tasks', broker=CELERY_BROKER_URL, backend=CELERY_RESULT_BACKEND)


logger = logging.getLogger("tdm.upload_student_attendance")


@celery.task(name='tasks.upload_student_attendance')
def upload_student_attendance(**kwargs):
    """
    Celery task for uploading student attendance related information
    :param kwargs:
    :return:
    """
    logger.info("Running upload task..")
    upload_data(kwargs)
    print(kwargs)
    return True

