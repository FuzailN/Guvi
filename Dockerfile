FROM python:3.8
WORKDIR /app
COPY ./web-apps/app.py .
COPY requirements.txt .
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
