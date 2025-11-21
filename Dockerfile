# Use a lightweight official Python image
FROM python:3.9-slim-buster

# Set a working directory in the container
WORKDIR /app

# Copy only requirements first (for better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your app code
COPY . .

# Expose the port that your Flask app runs on
EXPOSE 5070

# Set environment variable for Flask
ENV FLASK_APP=product_list_app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the Flask app
CMD ["flask", "run", "--port", "5070"]
