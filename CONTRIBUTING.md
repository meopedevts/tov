# Contributing to tov

Thank you for your interest in contributing to **tov**! This document outlines the guidelines and best practices for contributing to the project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Features](#suggesting-features)
  - [Submitting Changes](#submitting-changes)
- [Development Workflow](#development-workflow)
  - [Branch Naming Convention](#branch-naming-convention)
  - [Commit Messages](#commit-messages)
  - [Pull Requests](#pull-requests)
- [Testing Guidelines](#testing-guidelines)
- [Code Style](#code-style)
- [Review Process](#review-process)

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment. Be kind, constructive, and professional in all interactions.

## Getting Started

1. **Fork the repository** to your GitHub account
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/tov.git
   cd tov
   ```
3. **Add the upstream remote**:
   ```bash
   git remote add upstream https://github.com/ORIGINAL_OWNER/tov.git
   ```
4. **Install V** if you haven't already. Follow the [official V installation guide](https://vlang.io/)

## How to Contribute

### Reporting Bugs

Before reporting a bug, please:

1. **Search existing issues** to avoid duplicates
2. **Use the bug report template** when creating a new issue
3. **Include the following information**:
   - A clear and descriptive title
   - Steps to reproduce the issue
   - Expected behavior vs actual behavior
   - V version (`v version`)
   - Operating system and version
   - Relevant code snippets or error messages

### Suggesting Features

Feature requests are welcome! When suggesting a feature:

1. **Open an issue first** to discuss the feature before implementing it
2. **Describe the problem** the feature would solve
3. **Explain your proposed solution** in detail
4. **Consider alternatives** you've thought about

### Submitting Changes

1. **Always open an issue first** before starting work on significant changes
2. **Reference the issue** in your pull request
3. **Keep changes focused** - one feature or fix per PR

## Development Workflow

### Branch Naming Convention

Use descriptive branch names following this pattern:

| Type | Pattern | Example |
|------|---------|---------|
| Feature | `feature/<issue-number>-<short-description>` | `feature/42-add-csv-support` |
| Bug Fix | `fix/<issue-number>-<short-description>` | `fix/15-handle-empty-files` |
| Documentation | `docs/<short-description>` | `docs/update-readme` |
| Refactoring | `refactor/<short-description>` | `refactor/improve-parser` |
| Tests | `test/<short-description>` | `test/add-xml-tests` |
| Chore | `chore/<short-description>` | `chore/update-dependencies` |

**Examples:**
```bash
git checkout -b feature/23-add-ini-support
git checkout -b fix/45-handle-unicode-content
git checkout -b docs/improve-contributing-guide
```

### Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>: <description>

[optional body]

[optional footer(s)]
```

**Types:**
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, semicolons, etc.)
- `refactor`: Code refactoring without feature changes
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```
feat: add support for INI file format

fix: handle empty file content gracefully

Fixes #45

docs: update installation instructions

test: add edge case tests for detect_file_type
```

### Pull Requests

1. **Create a draft PR early** for complex changes to get early feedback
2. **Link the related issue** using keywords:
   ```
   Closes #42
   Fixes #15
   Resolves #23
   ```
3. **Fill out the PR template** completely
4. **Ensure all checks pass** before requesting review
5. **Keep your branch up to date** with the main branch:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

**PR Title Format:**
```
<type>: <description> (#issue-number)
```

**Example:**
```
feat: add CSV file type detection (#42)
```

## Testing Guidelines

All contributions must include appropriate tests. We use V's built-in testing framework.

### Test File Structure

- Test files must be named `*_test.v`
- Test files must be in the same module as the code being tested
- Test functions must start with `test_`

### Writing Tests

```v
module files

fn test_function_name_describes_expected_behavior() {
    // Setup
    input := 'test input'

    // Execute
    result := function_under_test(input)

    // Verify
    assert result == expected_value
}
```

### Test Naming Convention

Use descriptive names that explain the tested behavior:

```v
// ✅ Good - describes the behavior
fn test_detect_file_type_returns_json_for_json_extension() {}
fn test_detect_file_type_returns_unknown_for_empty_string() {}

// ❌ Bad - too generic
fn test_detect_file_type() {}
fn test_json() {}
```

### Test Categories

Include tests for:

1. **Happy path** - Normal expected usage
2. **Edge cases** - Empty strings, null values, boundary conditions
3. **Error cases** - Invalid inputs, malformed data
4. **Integration** - Components working together

### Running Tests

```bash
# Run all tests
v test .

# Run tests in a specific directory
v test src/files/

# Run tests with verbose output
v -stats test .
```

### Test Coverage

Aim for comprehensive coverage:

- All public functions should have tests
- All code paths should be exercised
- All error conditions should be verified

## Code Style

### General Guidelines

1. **Follow V's official style guide**
2. **Use meaningful variable and function names**
3. **Keep functions small and focused**
4. **Add comments for complex logic**
5. **Avoid magic numbers** - use named constants

### Formatting

Run the V formatter before committing:

```bash
v fmt -w .
```

### Documentation

- Document all public functions
- Include examples for complex APIs
- Keep documentation up to date with code changes

## Review Process

1. **All PRs require at least one approval** before merging
2. **Address all review comments** before requesting re-review
3. **Don't force-push** after review has started (unless requested)
4. **Squash commits** if requested by maintainers

### What Reviewers Look For

- Code correctness and logic
- Test coverage and quality
- Documentation completeness
- Adherence to project conventions
- Performance considerations
- Security implications

---

## Questions?

If you have questions about contributing, feel free to:

1. Open a discussion in the repository
2. Ask in an existing related issue
3. Reach out to the maintainers

Thank you for contributing to **tov**! 🎉

