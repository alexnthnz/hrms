# Workforce Ops Domain - time, leave, scheduling, payroll/benefits

load("@io_bazel_rules_go//go:def.bzl", "go_library")

# All Workforce Ops domain services
filegroup(
    name = "all",
    srcs = [
        "//backend/domains/workforce-ops/services/time-service:all",
        "//backend/domains/workforce-ops/services/payroll-service:all", 
        "//backend/domains/workforce-ops/services/benefits-service:all",
        "//backend/domains/workforce-ops/services/scheduling-service:all",
    ],
    visibility = ["//backend:__pkg__"],
)

# Shared libraries for Workforce Ops domain
go_library(
    name = "workforce_ops_common",
    srcs = glob(["internal/**/*.go"]),
    importpath = "github.com/your-org/hrms/backend/domains/workforce-ops/internal",
    deps = [
        "//backend:common",
        "//backend:shared",
        "//shared:proto_go",
    ],
    visibility = ["//backend/domains/workforce-ops:__subpackages__"],
)
