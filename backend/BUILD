# Backend BUILD file

load("@io_bazel_rules_go//go:def.bzl", "go_library")

# All backend services
filegroup(
    name = "all",
    srcs = [
        "//backend/domains/people:all",
        "//backend/domains/talent:all", 
        "//backend/domains/workforce-ops:all",
        "//backend/domains/it-finance:all",
        "//backend/domains/platform:all",
        "//backend/domains/ai:all",  # Python-based AI services
    ],
    visibility = ["//visibility:public"],
)

# Go module and dependencies
go_library(
    name = "common",
    srcs = glob(["internal/common/**/*.go"]),
    importpath = "github.com/your-org/hrms/backend/internal/common",
    visibility = ["//backend:__subpackages__"],
    deps = [
        "@com_github_gin_gonic_gin//:gin",
        "@com_github_spf13_viper//:viper",
        "@org_uber_go_zap//:zap",
        "@com_github_google_uuid//:uuid",
    ],
)

# Shared Go libraries for all backend services
go_library(
    name = "shared",
    srcs = glob(["internal/shared/**/*.go"]),
    importpath = "github.com/your-org/hrms/backend/internal/shared",
    visibility = ["//backend:__subpackages__"],
    deps = [
        ":common",
        "//shared:proto_go",
    ],
)
