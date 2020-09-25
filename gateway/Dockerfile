FROM ekoindarto/speeltuin
MAINTAINER Vyacheslav Tykhonov
COPY . /app
WORKDIR /app
ENV LC_ALL=en_US.UTF-8
ENV PYTHONIOENCODING=utf-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["cvm-skos.py"]
