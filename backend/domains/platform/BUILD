# Platform/Foundation Domain - multi-tenant, policy/automation, analytics, compliance

load("@io_bazel_rules_go//go:def.bzl", "go_library")

# All Platform domain services
filegroup(
    name = "all",
    srcs = [
        "//backend/domains/platform/services/tenant-service:all",
        "//backend/domains/platform/services/policy-service:all", 
        "//backend/domains/platform/services/analytics-service:all",
        "//backend/domains/platform/services/compliance-service:all",
    ],
    visibility = ["//backend:__pkg__"],
)

# Shared libraries for Platform domain
go_library(
    name = "platform_common",
    srcs = glob(["internal/**/*.go"]),
    importpath = "github.com/your-org/hrms/backend/domains/platform/internal",
    deps = [
        "//backend:common",
        "//backend:shared",
        "//shared:proto_go",
    ],
    visibility = ["//backend/domains/platform:__subpackages__"],
)
