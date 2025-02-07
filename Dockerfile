# Pull base image
FROM python:3.12-slim

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set working directory
WORKDIR /code/

# install dependencies
RUN pip install uv
COPY pyproject.toml /code/

RUN uv build
RUN pip install .

# copy code to container
COPY . /code/

# Run create_tc_db.py when the container launches
ENTRYPOINT ["python", "./create_tc_db.py"]