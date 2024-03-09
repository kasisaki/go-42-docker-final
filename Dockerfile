# Utilising official Golang image of the version stated in go.mod
FROM golang:1.22.0

# Changing the working directory
WORKDIR /app

# Download files to handle dependencies
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code and the DB
COPY *.go tracker.db ./

# Building the Go-application
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /42-docker-final

# Specify the entrypoint
CMD ["/42-docker-final"]