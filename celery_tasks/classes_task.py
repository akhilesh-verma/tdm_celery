import os

from celery import Celery

CELERY_BROKER_URL = os.environ.get('CELERY_BROKER_URL', 'pyamqp://rabbit:5672/'),
CELERY_RESULT_BACKEND = os.environ.get('CELERY_RESULT_BACKEND', 'pyamqp://rabbit:5672/')

celery = Celery('tasks', broker=CELERY_BROKER_URL, backend=CELERY_RESULT_BACKEND)


@celery.task(name='tasks.classes_report')
def classes_report(**kwargs):
    """
    Celery task for updating class related information
    :param kwargs:
    :return: True on success, False on failure
    """
    print(kwargs)
    pass
