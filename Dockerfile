# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Install system dependencies (for opencv-python and other packages)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV PORT 8000

# Run the FastAPI app with uvicorn
CMD ["uvicorn", "makeup_app:app", "--host", "0.0.0.0", "--port", "8000"]
