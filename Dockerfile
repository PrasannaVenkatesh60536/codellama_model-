FROM python:3.8

# Set the working directory
WORKDIR /app

# Copy the application files to the container
COPY . /app

# Create codellama_model directory if it doesn't exist
RUN mkdir -p /app/codellama_model

# Download Codellama model files and extract them
RUN curl -LJO <URL_TO_CODELLAMA_MODEL_TARBALL>
RUN tar -xvzf codellama_model.tar.gz -C /app/codellama_model
RUN rm codellama_model.tar.gz

# Install dependencies
RUN pip install -r requirements.txt

# Expose the port the app runs on
EXPOSE 8080

# Command to run your application
CMD ["python", "app.py"]
