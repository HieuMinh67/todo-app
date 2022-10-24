# pull official base image
FROM python:3.10.7-slim

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


COPY ./accounts accounts
COPY ./api api
COPY ./lists lists
COPY ./todolist todolist
COPY ./manage.py .
RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]