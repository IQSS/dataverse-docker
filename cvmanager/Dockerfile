FROM python:2.7
MAINTAINER Vyacheslav Tykhonov
COPY . /widget
WORKDIR /widget
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]
