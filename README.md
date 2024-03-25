# Rust Microservice

This project is a Continuous Delivery of Rust Microservice that return the number of students in each ap classes. This function is based on mini-project5

# Requirements
- Simple REST API/web service in Rust
- Dockerfile to containerize service
- CI/CD pipeline files
* REST API Endpoint: Processes JSON requests to calculate the sum of numbers.
* Interactive Web Interface: Users can input a list of numbers to calculate their sum directly from their browser.
## Please refer to the demo video in the repo: demo.mp4

## Author
Zairan Xiang

## Procedures:

1. Create a new Rust Project:
```cargo new new_project```

2. Add dependencies to Cargo.toml file.

3. Develop application code in the src/main.rs file

4. Containerize the Rust Actix Web App: 

```bash
FROM rust:1.75 AS builder

# Set the working directory
WORKDIR /usr/src/my_serverless_microservice

# Change the user to root
USER root

# Copy everything
COPY . .

# Build the project
RUN cargo build --release

# Expose port 8080
EXPOSE 8080

# Define the default command to run
CMD cargo run
```

5. Run the following command:
```docker build -t my_serverless_microservice .```
8. Run the Container locally:
```docker run -p 8080:8080 my_serverless_microservice```
