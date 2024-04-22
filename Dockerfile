# Use a Rust base image
FROM rust:latest as builder

# Set the working directory
WORKDIR /usr/src/app

# Copy the local Cargo.toml and Cargo.lock files to the container
COPY Cargo.toml Cargo.lock ./

# Build dependencies to speed up the build process
RUN mkdir src && echo "fn main() {}" > src/main.rs && cargo build --release

# Copy the entire source code to the container
COPY . .

# Build the application
RUN cargo build --release

# Use a slim ubuntu image for the final container
FROM ubuntu:latest

# Set the working directory
WORKDIR /usr/src/app

# Copy the built binary from the builder image
COPY --from=builder /usr/src/app/target/release/serverless_rust_microservice .

# Expose the application port
EXPOSE 8088

# Set the command to run the application
CMD ["./serverless_rust_microservice"]