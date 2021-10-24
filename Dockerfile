FROM tiangolo/uvicorn-gunicorn:python3.8-slim

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt .

# install system dependencies
RUN apt-get update \
  && apt-get -y install netcat gcc postgresql \
  && apt-get clean \
  && pip install --no-cache-dir --trusted-host pypi.org --trusted-host files.pythonhosted.org --use-deprecated=legacy-resolver -r requirements.txt

COPY . .
