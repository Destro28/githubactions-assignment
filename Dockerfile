FROM python:3.10
WORKDIR /app
# create a working directory in the container called '/app'
# and set it as the current working directory
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 80
CMD ["python", "app.py"]
# This Dockerfile sets up a Python environment, installs dependencies from requirements.txt,
# copies the application code into the container, exposes port 80, and runs the app using Python.