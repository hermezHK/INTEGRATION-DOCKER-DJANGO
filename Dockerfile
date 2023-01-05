FROM python:3.11-slim

# Install system dependencies
RUN apt update && apt install -y \
  libpq-dev \
  gcc \
  && rm -rf /var/lib/apt/lists/*

# Create and set the working directory
RUN mkdir /app
WORKDIR /app

# Install Python dependencies
COPY requirements.txt /app
RUN pip install -r requirements.txt

# Copy the application code
COPY . /app

# Set environment variables
# ENV DJANGO_SETTINGS_MODULE=beni_api.settings.production
ENV PYTHONPATH=/app

# # Collect static files
# RUN python manage.py collectstatic --no-input

# Expose the application port
EXPOSE 8000

# Set the default command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]