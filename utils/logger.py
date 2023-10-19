"""
(c) Copyright Jalasoft. 2023

logger.py
    logger implementation
"""
import logging
import os
import pathlib
import sys

from datetime import datetime
from logging import handlers

DEFAULT_GLOBAL_LEVEL = logging.INFO
# formatter logger
DEFAULT_LOG_FORMAT = "%(asctime)s UTC %(levelname)-8s %(name)-15s %(message)s"


def get_logger(name, level=DEFAULT_GLOBAL_LEVEL, log_format=DEFAULT_LOG_FORMAT):
    """
    Configure logging instance and return it to the caller.
    :param name:        str     Name for logger
    :param level:       int     Number of log level:
                                logging.DEBUG 10
                                logging.INFO 20
                                logging.WARNING 30
                                logging.ERROR 40
                                logging.CRITICAL 50
    :param log_format:  str     Output format for logs
    :return:            object  Logger object
    """

    logger = logging.getLogger(name)
    log_file_name = datetime.now().strftime("%m_%d_%Y_%H_%M_%S")
    if not logger.handlers:
        for handler in logger.handlers:
            logger.removeHandler(handler)
        handler = logging.StreamHandler(sys.__stdout__)
        handler.setLevel(level)
        # Create a rotating file handler
        abs_path = os.path.abspath(__file__ + "../../../")
        pathlib.Path(f"{abs_path}/logs").mkdir(parents=True, exist_ok=True)
        handler_file = handlers.RotatingFileHandler(
            f"{abs_path}/logs/log_{log_file_name}.log", maxBytes=1000000, backupCount=5
        )
        handler_file.setLevel(level)
        fmt = logging.Formatter(log_format)
        # set format and add handlers
        handler.setFormatter(fmt)
        handler_file.setFormatter(fmt)
        logger.addHandler(handler)
        logger.addHandler(handler_file)
        logger.setLevel(level)
        logger.propagate = False

    return logger
