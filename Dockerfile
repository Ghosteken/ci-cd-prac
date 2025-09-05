# Use Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Update system packages to fix vulnerabilities and remove unnecessary packages
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get dist-upgrade -y && \
	apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Run the Flask app
CMD ["python", "app.py"]
