# IT & Finance Adjacent Domain - identity, devices, apps, expenses

load("@io_bazel_rules_go//go:def.bzl", "go_library")

# All IT & Finance domain services
filegroup(
    name = "all",
    srcs = [
        "//backend/domains/it-finance/services/identity-service:all",
        "//backend/domains/it-finance/services/device-service:all", 
        "//backend/domains/it-finance/services/app-service:all",
        "//backend/domains/it-finance/services/expense-service:all",
    ],
    visibility = ["//backend:__pkg__"],
)

# Shared libraries for IT & Finance domain
go_library(
    name = "it_finance_common",
    srcs = glob(["internal/**/*.go"]),
    importpath = "github.com/your-org/hrms/backend/domains/it-finance/internal",
    deps = [
        "//backend:common",
        "//backend:shared",
        "//shared:proto_go",
    ],
    visibility = ["//backend/domains/it-finance:__subpackages__"],
)
