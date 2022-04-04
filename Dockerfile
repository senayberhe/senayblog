FROM python:3.9-slim

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

RUN adduser -D myblog 


WORKDIR /home/myblog 

# Install pipenv and compilation dependencies
RUN pip install pipenv
RUN apt-get update && apt-get install -y --no-install-recommends gcc

# Install python dependencies in /.venv
COPY Pipfile .
COPY Pipfile.lock .
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy

COPY app app
COPY migrations migrations
COPY myblog.py config.py boot.sh ./
RUN chmod +x boot.sh
ENV FLASK_APP myblog.py
RUN chown -R myblog:myblog ./
USER myblog
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
