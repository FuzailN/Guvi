FROM python:3.8
WORKDIR web-apps/app
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
