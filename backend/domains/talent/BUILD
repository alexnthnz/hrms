# Talent Domain - hire → grow → retain

load("@io_bazel_rules_go//go:def.bzl", "go_library")

# All Talent domain services
filegroup(
    name = "all",
    srcs = [
        "//backend/domains/talent/services/recruiting-service:all",
        "//backend/domains/talent/services/performance-service:all", 
        "//backend/domains/talent/services/learning-service:all",
    ],
    visibility = ["//backend:__pkg__"],
)

# Shared libraries for Talent domain
go_library(
    name = "talent_common",
    srcs = glob(["internal/**/*.go"]),
    importpath = "github.com/your-org/hrms/backend/domains/talent/internal",
    deps = [
        "//backend:common",
        "//backend:shared",
        "//shared:proto_go",
    ],
    visibility = ["//backend/domains/talent:__subpackages__"],
)
