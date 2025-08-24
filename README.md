# HRMS - Human Capital Management Platform

A modern, scalable Human Capital Management platform built with domain-driven design principles, similar to Rippling. This monorepo contains backend services written in Go (with Python for AI), and frontend applications built with TypeScript/React.

## Architecture Overview

### Bounded Contexts (Domains)

1. **People Domain** - Core HR (source of truth for workers)
   - Employee Service
   - Organization Service  
   - Profile Service

2. **Talent Domain** - hire → grow → retain
   - Recruiting Service
   - Performance Service
   - Learning Service

3. **Workforce Ops Domain** - time, leave, scheduling, payroll/benefits
   - Time Service
   - Payroll Service
   - Benefits Service
   - Scheduling Service

4. **IT & Finance Domain** - identity, devices, apps, expenses
   - Identity Service
   - Device Service
   - App Service
   - Expense Service

5. **Platform Domain** - multi-tenant, policy/automation, analytics, compliance
   - Tenant Service
   - Policy Service
   - Analytics Service
   - Compliance Service

6. **AI Domain** - machine learning and AI services (Python-based)
   - ML Service
   - NLP Service
   - Recommendation Service

## Technology Stack

### Backend
- **Primary Language**: Go 1.21+
- **AI Services**: Python 3.11+ (TensorFlow, PyTorch, transformers)
- **Package Management**: UV for Python (fast dependency resolution)
- **Web Framework**: Gin (Go), FastAPI (Python)
- **Database**: PostgreSQL + Redis
- **Message Queue**: Kafka
- **Protocol Buffers**: gRPC for service communication

### Frontend
- **Languages**: TypeScript
- **Framework**: React 18
- **State Management**: Zustand
- **UI Library**: Tailwind CSS + Headless UI
- **Data Fetching**: TanStack Query

### Build System
- **Bazel**: Multi-language monorepo build system
- **Docker**: Containerization
- **Gazelle**: Go dependency management
- **UV**: Fast Python package manager and resolver

## Getting Started

### Prerequisites

- Bazel 6.0+
- Go 1.21+
- Node.js 18+
- Python 3.11+ (for AI services)
- UV (Python package manager - auto-installed by setup script)
- Docker (optional)

### Quick Setup

```bash
# Clone the repository
git clone <your-repo-url>
cd hrms

# Run the setup script
./tools/scripts/dev-setup.sh

# Or manual setup:
cd frontend && npm install && cd ..
bazel build //...
bazel test //...
```

### Development Commands

```bash
# Build all services
bazel build //...

# Build specific domain
bazel build //backend/domains/people:all

# Run tests
bazel test //...

# Start frontend development server
bazel run //frontend/web-app:dev_server

# Start a specific service
bazel run //backend/domains/people/services/employee-service:employee_service

# Generate Go dependencies from go.mod
bazel run //:gazelle-update-repos

# Update BUILD files
bazel run //:gazelle
```

## Project Structure

```
hrms/
├── backend/                 # Go backend services
│   ├── domains/            # Domain-specific services
│   │   ├── people/         # People domain (Go)
│   │   ├── talent/         # Talent domain (Go)  
│   │   ├── workforce-ops/  # Workforce Ops domain (Go)
│   │   ├── it-finance/     # IT & Finance domain (Go)
│   │   ├── platform/       # Platform domain (Go)
│   │   ├── ai/            # AI domain (Python)
│   │   └── BUILD          # Domains build configuration
│   ├── internal/          # Shared Go libraries
│   ├── go.mod            # Go dependencies
│   ├── pyproject.toml    # Python dependencies & config
│   ├── requirements_lock.txt # UV-generated lock file
│   └── BUILD             # Bazel build configuration
├── frontend/               # TypeScript frontend applications
│   ├── web-app/           # Main web application
│   ├── mobile-app/        # Mobile application
│   ├── admin-portal/      # Admin portal
│   └── libs/              # Shared frontend libraries
├── shared/                 # Cross-language shared code
│   ├── proto/             # Protocol buffer definitions
│   ├── types/             # TypeScript type definitions
│   ├── events/            # Domain event definitions
│   └── configs/           # Configuration files
├── tools/                 # Development and build tools
│   ├── docker/           # Docker configurations
│   ├── scripts/          # Build and deployment scripts
│   └── python/           # Python toolchain configuration
├── WORKSPACE             # Bazel workspace configuration
├── .bazelrc              # Bazel build configuration
└── BUILD                 # Root build configuration
```

## Development Workflow

1. **Domain Services**: Each domain contains microservices with clear boundaries
2. **Event-Driven**: Services communicate via domain events and integration events
3. **API-First**: All services expose REST and gRPC APIs
4. **Multi-Language**: Go for most backend services, Python for AI/ML workloads
5. **Shared Libraries**: Common functionality in shared packages
6. **Protocol Buffers**: Strongly typed service contracts

## Contributing

1. Follow domain-driven design principles
2. Each service should have clear bounded context
3. Use Protocol Buffers for service interfaces
4. Write comprehensive tests
5. Update BUILD files when adding dependencies

## License

[Your License Here]