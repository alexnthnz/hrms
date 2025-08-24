# Employee Service - Core employee data management

load("@io_bazel_rules_go//go:def.bzl", "go_binary", "go_library", "go_test")
load("@io_bazel_rules_docker//go:image.bzl", "go_image")

go_library(
    name = "employee_service_lib",
    srcs = glob([
        "**/*.go",
        "!main.go",
        "!*_test.go",
    ]),
    importpath = "github.com/your-org/hrms/backend/domains/people/services/employee-service",
    deps = [
        "//backend:common",
        "//backend:shared",
        "//backend/domains/people:people_common",
        "//shared:proto_go",
        "@com_github_gin_gonic_gin//:gin",
        "@io_gorm_gorm//:gorm",
        "@io_gorm_driver_postgres//:postgres",
        "@com_github_google_uuid//:uuid",
    ],
    visibility = ["//visibility:private"],
)

go_binary(
    name = "employee_service",
    srcs = ["main.go"],
    deps = [
        ":employee_service_lib",
    ],
    visibility = ["//visibility:public"],
)

# Docker image for deployment
go_image(
    name = "employee_service_image",
    srcs = ["main.go"],
    deps = [":employee_service_lib"],
    goarch = "amd64",
    goos = "linux",
)

# Tests
go_test(
    name = "employee_service_test",
    srcs = glob(["*_test.go"]),
    deps = [
        ":employee_service_lib",
        "@com_github_stretchr_testify//assert",
        "@com_github_stretchr_testify//suite",
    ],
    tags = ["unit"],
)

filegroup(
    name = "all",
    srcs = [
        ":employee_service",
        ":employee_service_image",
    ],
    visibility = ["//backend/domains/people:__pkg__"],
)
