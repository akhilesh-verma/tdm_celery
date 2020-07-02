import os
from abc import ABC, abstractmethod
import logging
import requests

logger = logging.getLogger("tdm.classes_task")


def class_data(**kwargs):
    """
    Initiate an upload for attendance data
    :param kwargs: Keyword arguments
    :return: None
    """
    class_name = kwargs['class_name']
    date = kwargs['date']
    subject = kwargs['subject']
    compress = kwargs.get('compress', False)

    logger.info("Updating class data, class_name: {}, date: {}, subject: {}".format(
        class_name, date, subject
    ))

    pass
