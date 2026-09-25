---
name: crm-testing
description: Triggers when we want to run unit/feature tests for any of the crm-x services. Uses docker to run tests. 
metadata:
  origin: ME
---

# CRM Testing

Describes how to run unit/feature tests for crm-x services.

## When to Use

- Running unit/feature tests on the supported crm-x services.

## Tools Used

- **Docker**: Containerization platform to run the services.
- **Docker Compose**: Orchestration tool for managing multi-container services.
- **PHP Artisan**: Command-line interface for Laravel, used here to run tests.
- **Test Script**: A bundled script `scripts/run-test.sh` to automate test execution.

## Supported Services

| Service | Location | Docker Service Name |
|---------|----------|---------------------|
| backend | `/Users/alif/workspace/github.com/alifR999/crm-backend` | `api.crm.test` |
| subscriptions | `/Users/alif/workspace/github.com/alifR999/crm-subscriptions` | `subscription` |
| product-catalogue | `/Users/alif/workspace/github.com/alifR999/crm-product-catalogue` | `product` |

## How It Works

- The skill provides a helper script `scripts/run-test.sh` that handles the test execution.
- Tests are run inside Docker containers.
- The `compose.yml` file is located in the backend service.
- The script checks if containers are running using `docker compose ps` before attempting to run tests.

## What not to do

- do not edit the `phpunit.xml`
- do not edit the `.env.testing`

### Examples

#### Run unit/feature tests for a service

- Execute the provided script: `scripts/run-test.sh <service-name> [output-file]`
- Example: `scripts/run-test.sh backend test-output.log`
- If an `<output-file>` is used, analyze it to:
  - Count passing and failing tests.
  - Find the location (file and line) of any failures.
- Remember to remove the `<output-file>` when analysis is complete.


