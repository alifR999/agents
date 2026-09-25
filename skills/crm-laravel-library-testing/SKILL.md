---
name: crm-laravel-library-testing
description: Triggers when we want to run unit/feature tests for crm-laravel-library repo. Uses local php to run tests. 
metadata:
  origin: ME
---

# CRM Laravel Library Testing

Describes how to run unit/feature tests for the `crm-laravel-library` repository using a local PHP environment.

## When to Use

- Running unit or feature tests on the `crm-laravel-library` codebase.
- Verifying library functionality before integration or release.
- Debugging failures locally using native PHP tools.

## Tools Used

| Tool | Purpose |
|------|---------|
| **PHP** | Local runtime environment (PHP 8.2+ required). |
| **Composer** | Dependency manager and script runner. |
| **PHPUnit** | Core testing framework for executing the suite. |
| **Orchestra Testbench** | Provides a Laravel-like environment for testing the library. |

## How It Works

- Tests are executed natively on the host using the local PHP installation.
- The library uses `orchestra/testbench` to simulate a Laravel application context, allowing tests to use Laravel features (Service Providers, Facades, etc.).
- Configuration is pulled from `phpunit.xml` or `phpunit.xml.dist` in the repository root.
- The `workbench` directory contains a skeleton app used during testing.

## Prerequisites

- **PHP Version**: Ensure PHP 8.2 or higher is installed (`php -v`).
- **Dependencies**: Install required packages before running tests:
  ```bash
  composer install
  ```
- **Environment**: Check if `.env.testing` exists or if environment variables need to be set for specific tests (e.g., API keys).

## What not to do

- **Do not edit** `phpunit.xml` or `phpunit.xml.dist` unless adding temporary debug listeners.
- **Do not edit** `.env.testing` directly; use environment variables for overrides.
- **Do not ignore** failing tests; always investigate the root cause in the `logs/` directory if available.

### Examples

#### Run all tests

Navigate to the repository and run PHPUnit:
```bash
cd /Users/alif/workspace/github.com/alifR999/crm-laravel-library
vendor/bin/phpunit
```
Alternatively, use the composer script:
```bash
composer test
```

#### Run specific tests

- **By file**: `vendor/bin/phpunit tests/Unit/ExampleTest.php`
- **By filter (method name)**: `vendor/bin/phpunit --filter test_it_can_do_something`
- **By group**: `vendor/bin/phpunit --group api`

#### Save and analyze output

It is highly recommended to save output to a file for detailed analysis:
```bash
vendor/bin/phpunit > test-results.log 2>&1
```

Analyze the `test-results.log` to:
- Identify the exact number of **Failures** and **Errors**.
- Locate the file and line number for each failure.
- Check stack traces for unexpected exceptions.
- **Note**: Delete the log file once analysis is complete to keep the workspace clean.

### Troubleshooting

- **Missing Vendor**: If `vendor/bin/phpunit` is not found, run `composer install`.
- **Autoload issues**: Try running `composer dump-autoload` if new classes are not recognized.
- **Testbench Errors**: If you see errors related to the workbench, try clearing the skeleton:
  ```bash
  composer clear
  ```
