# Use a minimal base image (Alpine in this case)
FROM alpine:latest

# Install dependencies
RUN apk update && \
    apk add --no-cache \
    curl \
    jq \
    bash

# Install Trivy
RUN curl -sfL https://github.com/aquasecurity/trivy/releases/download/v0.38.3/trivy_0.38.3_Linux-64bit.tar.gz | tar xz -C /usr/local/bin

# Set up a working directory
WORKDIR /workspace

# Define the entrypoint to run Trivy with arguments passed to the container
ENTRYPOINT ["trivy"]
CMD ["image", "--no-progress", "--format", "json"]
