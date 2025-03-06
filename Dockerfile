FROM python:3.10

# Set the working directory inside the container
WORKDIR /app

# Install necessary dependencies
RUN apt update && apt install -y git

# Clone Meditron repository inside the container
RUN git clone https://github.com/epfLLM/meditron.git && \
    cd meditron && \
    pip install -r requirements.txt

# Expose the server port
EXPOSE 8000

# Command to start the Meditron API server
CMD ["python", "-m", "meditron.server"]
