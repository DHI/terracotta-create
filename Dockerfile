# Pull base image
FROM python:3.10-slim

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set working directory
WORKDIR /code/

# install dependencies
RUN pip install poetry
COPY pyproject.toml /code/

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-ansi

# copy code to container
COPY . /code/

# Run create_tc_db.py when the container launches
ENTRYPOINT ["python", "./create_tc_db.py"]