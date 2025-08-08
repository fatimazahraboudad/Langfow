# Use the latest version of the base Langflow image
FROM langflowai/langflow:latest

# Create folders and set the working directory in the container
RUN mkdir /app/flows
WORKDIR /app

# Copy flows, langflow-config-dir, and docker.env to the container
COPY flows /app/flows
COPY docker.env /app/.env


# Set environment variables if not set in docker.env
ENV PYTHONPATH=/app
ENV LANGFLOW_LOAD_FLOWS_PATH=/app/flows

# Command to run the Langflow server on port 7860
EXPOSE 7860
CMD ["langflow", "run", "--env-file","/app/.env","--host", "0.0.0.0", "--port", "7860"]
