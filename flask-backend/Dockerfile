# Use the official Python image as the base image
FROM python:3.9.22

# Set the working directory in the container
WORKDIR /app

# Install system dependencies, including tini
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install requirements
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Add Tini
ENV TINI_VERSION=v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

ENV FLASK_ENV=development
ENV FLASK_APP=app.py

# Expose the default Jupyter Lab port
EXPOSE 5000

# Set the command to run Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--reload"]