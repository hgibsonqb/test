FROM python:3.8-slim-buster AS base

ENV APP_HOME /test

RUN groupadd --gid 1000 test && \
    useradd -rM -d $APP_HOME -s /bin/sh --uid 1000 -g test test

USER test
WORKDIR $APP_HOME

COPY requirements.txt $APP_HOME/requirements.txt
RUN pip3 install -r $APP_HOME/requirements.txt

COPY . $APP_HOME

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
