# pull official base image
FROM python:3.9.6-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip && \
    pip install --upgrade setuptools
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY . .
CMD python manage.py migrate
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]