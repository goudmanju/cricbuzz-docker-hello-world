# Stage 1: Build the Go binary
FROM golang:1.21 AS builder
WORKDIR /app
# Copy go module files and source code
COPY go.mod go.sum ./
RUN go mod download
COPY . .
# Build the Go binary
RUN CGO_ENABLED=0 GOOS=linux go build -o hello_world
# Stage 2: Build minimal final image
FROM ghcr.io/vincetse/scratch
LABEL maintainer="Vince Tse <vincetse@users.noreply.github.com>"
# Copy binary from builder stage
COPY --from=builder /app/hello_world /hello_world
ENV GIN_MODE=release
EXPOSE 8000
ENTRYPOINT ["/hello_world"]
