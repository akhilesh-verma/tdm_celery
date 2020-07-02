import os
from abc import ABC, abstractmethod
import logging
import requests

logger = logging.getLogger("tdm.attendance_task")


def upload_data(**kwargs):
    """
    Initiate an upload for attendance data
    :param kwargs: Keyword arguments
    :return: None
    """
    name = kwargs['name']
    date = kwargs['date']
    subject = kwargs['subject']
    compress = kwargs.get('compress', False)

    logger.info("Updating attendance table, name: {}, date: {}, subject: {}".format(
        name, date, subject
    ))

    pass


