# Web App - Main employee-facing web application

load("@build_bazel_rules_nodejs//:index.bzl", "nodejs_binary")
load("@npm//@bazel/typescript:index.bzl", "ts_library")
load("@npm//@bazel/webpack:index.bzl", "webpack_bundle")

ts_library(
    name = "web_app_lib",
    srcs = glob([
        "src/**/*.ts",
        "src/**/*.tsx",
    ]),
    deps = [
        "@npm//@types/react",
        "@npm//@types/react-dom", 
        "@npm//react",
        "@npm//react-dom",
        "@npm//react-router-dom",
        "@npm//@tanstack/react-query",
        "@npm//axios",
        "@npm//zustand",
        "//shared:types_ts",
    ],
    tsconfig = "//frontend:tsconfig.json",
)

webpack_bundle(
    name = "web_app_bundle",
    srcs = [":web_app_lib"],
    entry_point = "src/index.tsx",
    output_dir = True,
    webpack_config = "webpack.config.js",
)

nodejs_binary(
    name = "dev_server",
    data = [
        ":web_app_lib",
        "//frontend:package_json",
    ],
    entry_point = "scripts/dev-server.js",
)

filegroup(
    name = "all",
    srcs = [
        ":web_app_bundle",
        ":dev_server",
    ],
    visibility = ["//frontend:__pkg__"],
)
