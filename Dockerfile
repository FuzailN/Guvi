FROM python:3.8
WORKDIR /app
COPY ./web-apps/app.py /app
COPY ./requirements.txt /app/
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
