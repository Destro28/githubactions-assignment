# GitHub Actions Assignment

This repository demonstrates a practical CI/CD pipeline for a Dockerized Python Flask API using GitHub Actions, with a focus on zero-downtime deployment strategies.

## Overview

The primary goal of this project is to showcase automated deployment of a Flask API container, using GitHub Actions for continuous integration and deployment. The workflow is triggered **only on pushes to the `main` branch** and handles building, transferring, and deploying Docker images to a remote VM.

## Project Structure

- **Dockerfile**: Containerizes the Flask API application.
- **Python code**: Contains the application logic and API endpoints.
- **.github/workflows/deploy.yml**: GitHub Actions workflow that automates the build and deployment process.

## CI/CD Pipeline Details

- **Trigger:** Workflow runs exclusively on pushes to the `main` branch.
- **Build:** Docker image for the Flask API is built on each push.
- **Artifact Handling:** The Docker image is saved as a tar archive and securely copied to a remote VM using SSH.
- **Zero-Downtime Deployment:**  
  The deployment process intelligently uses both "new" and "old" containers to minimize downtime:
  - The new image is first loaded and started as a temporary container on a test port.
  - A health check is performed against the `/sayHello` endpoint to verify the new container is running successfully.
  - Only after passing the health check does the script stop and remove the old production container, promote the new one to production, and clean up the temporary container.
  - This approach ensures that the application remains available during updates and any errors in the new deployment do not immediately affect production.

Secrets are used to securely handle VM credentials and connections.

---

This repository focuses on demonstrating practical CI/CD automation with GitHub Actions and zero-downtime deployment strategies for Dockerized Python applications.
