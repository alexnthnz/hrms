# People Domain - Core HR (source of truth for workers)

load("@io_bazel_rules_go//go:def.bzl", "go_library")

# All People domain services
filegroup(
    name = "all",
    srcs = [
        "//backend/domains/people/services/employee-service:all",
        "//backend/domains/people/services/org-service:all", 
        "//backend/domains/people/services/profile-service:all",
    ],
    visibility = ["//backend:__pkg__"],
)

# Shared libraries for People domain
go_library(
    name = "people_common",
    srcs = glob(["internal/**/*.go"]),
    importpath = "github.com/your-org/hrms/backend/domains/people/internal",
    deps = [
        "//backend:common",
        "//backend:shared",
        "//shared:proto_go",
    ],
    visibility = ["//backend/domains/people:__subpackages__"],
)
