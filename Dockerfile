# Use the base image
FROM ghcr.io/vincetse/scratch
# Set the maintainer label
LABEL maintainer="Vince Tse <vincetse@users.noreply.github.com>"
# Copy the hello_world binary into the container
COPY ./hello_world /hello_world
# Set environment variable
ENV GIN_MODE=release
# Expose port 8080
EXPOSE 8080
# Set the entrypoint to execute the hello_world binary
ENTRYPOINT ["/hello_world"]
