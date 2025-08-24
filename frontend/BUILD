# Frontend BUILD file

load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary")

# All frontend applications
filegroup(
    name = "all",
    srcs = [
        "//frontend/web-app:all",
        "//frontend/mobile-app:all",
        "//frontend/admin-portal:all",
    ],
    visibility = ["//visibility:public"],
)

# Package management
filegroup(
    name = "package_json",
    srcs = [
        "package.json",
        "package-lock.json",
    ],
    visibility = ["//frontend:__subpackages__"],
)
