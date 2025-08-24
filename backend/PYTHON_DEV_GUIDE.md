# Python Development Guide for HRMS

This guide covers Python development workflows using UV for the HRMS AI and future Python domains.

## Project Structure

```
backend/
├── pyproject.toml          # Python project configuration & dependencies  
├── requirements_lock.txt   # UV-generated lock file (committed)
├── .python-version         # Python version specification
└── domains/
    └── ai/                 # Python AI domain
```

## UV Workflow

### Installing Dependencies

```bash
# Install all dependencies from lock file (production-ready)
uv pip sync requirements_lock.txt

# Install with development dependencies
uv pip sync requirements_lock.txt --extra dev

# Install specific extras
uv pip sync requirements_lock.txt --extra test
```

### Managing Dependencies

```bash
# Add a new dependency
echo 'new-package>=1.0.0' >> pyproject.toml

# Update the lock file
uv pip compile pyproject.toml -o requirements_lock.txt

# Sync environment with new lock file
uv pip sync requirements_lock.txt
```

### Development Workflow

```bash
# Create virtual environment
uv venv

# Activate virtual environment
source .venv/bin/activate  # Linux/macOS
# or
.venv\Scripts\activate     # Windows

# Install development dependencies
uv pip sync requirements_lock.txt --extra dev

# Run tests
pytest

# Code formatting
black .
ruff check --fix .

# Type checking
mypy .
```

## Adding New Python Domains

### 1. Create Domain Structure
```bash
mkdir -p backend/domains/new-domain/{services,internal}
```

### 2. Create Domain BUILD File
```python
# backend/domains/new-domain/BUILD
load("@rules_python//python:defs.bzl", "py_library")

py_library(
    name = "new_domain_common",
    srcs = glob(["internal/**/*.py"]),
    deps = [
        "@python_deps//fastapi",    # Available from pyproject.toml
        "@python_deps//pydantic",   # Available from pyproject.toml
        "//shared:proto_py",
        "//shared:events",
    ],
    visibility = ["//backend/domains/new-domain:__subpackages__"],
)
```

### 3. Create Service BUILD Files
```python
# backend/domains/new-domain/services/my-service/BUILD
load("@rules_python//python:defs.bzl", "py_binary", "py_library", "py_test")

py_library(
    name = "my_service_lib",
    srcs = glob(["**/*.py", "!main.py", "!tests/**"]),
    deps = [
        "//backend/domains/new-domain:new_domain_common",
        "@python_deps//fastapi",    # Shared dependencies
    ],
)

py_binary(
    name = "my_service",
    srcs = ["main.py"],
    deps = [":my_service_lib"],
)
```

## Dependencies Management

### Available Packages

All Python domains automatically have access to packages defined in `pyproject.toml`:

- **AI/ML**: torch, tensorflow, transformers, scikit-learn
- **Web**: fastapi, uvicorn, pydantic
- **Data**: pandas, numpy
- **Database**: sqlalchemy, asyncpg, redis
- **Testing**: pytest, pytest-asyncio, pytest-cov
- **Utilities**: click, structlog, tenacity

### Adding New Dependencies

1. **Edit pyproject.toml**:
   ```toml
   dependencies = [
       # ... existing dependencies
       "new-package>=1.0.0",
   ]
   ```

2. **Update lock file**:
   ```bash
   cd backend
   uv pip compile pyproject.toml -o requirements_lock.txt
   ```

3. **Sync environment**:
   ```bash
   uv pip sync requirements_lock.txt
   ```

4. **All Python domains now have access** to `@python_deps//new_package`

## Benefits of UV

- **⚡ Speed**: 10-100x faster than pip
- **🔒 Deterministic**: Lock file ensures reproducible builds
- **🎯 Resolution**: Better dependency conflict resolution
- **📦 Modern**: Follows Python packaging standards (pyproject.toml)
- **🔄 Compatible**: Works with existing tools and CI/CD

## Best Practices

1. **Always commit** `requirements_lock.txt` to version control
2. **Use lock file** for production deployments (`uv pip sync`)
3. **Update regularly** to get security fixes
4. **Test** after dependency updates
5. **Use extras** for optional dependencies (dev, test, etc.)

## Troubleshooting

### Lock File Conflicts
```bash
# Regenerate lock file
uv pip compile pyproject.toml -o requirements_lock.txt --upgrade
```

### Cache Issues
```bash
# Clear UV cache
uv cache clean
```

### Version Conflicts
```bash
# Check dependency tree
uv pip tree
```
