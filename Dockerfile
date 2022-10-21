# pull official base image
FROM python:3.9.6-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt ./
RUN pip install -r requirements.txt


COPY . .
CMD python manage.py migrate
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]