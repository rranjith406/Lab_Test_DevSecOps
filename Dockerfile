FROM ubuntu:20.04
COPY /path/to/your/application /app
WORKDIR /app
EXPOSE 8080
CMD ["python", "app.py"]
