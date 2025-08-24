# Shared libraries and definitions

load("@rules_proto//proto:defs.bzl", "proto_library")
load("@io_bazel_rules_go//proto:def.bzl", "go_proto_library")
load("@rules_python//python:defs.bzl", "py_library")
load("@npm//@bazel/typescript:index.bzl", "ts_library")

# Protocol Buffers for service communication
proto_library(
    name = "hrms_proto",
    srcs = glob(["proto/**/*.proto"]),
    visibility = ["//visibility:public"],
)

# Go bindings for protobuf (primary backend)
go_proto_library(
    name = "proto_go",
    importpath = "github.com/your-org/hrms/shared/proto",
    proto = ":hrms_proto",
    visibility = ["//visibility:public"],
)

# Python bindings for protobuf (AI domain)
py_proto_library(
    name = "proto_py",
    deps = [":hrms_proto"],
    visibility = ["//visibility:public"],
)

# TypeScript types
ts_library(
    name = "types_ts",
    srcs = glob(["types/**/*.ts"]),
    visibility = ["//visibility:public"],
)

# Event definitions for domain communication
py_library(
    name = "events",
    srcs = glob(["events/**/*.py"]),
    deps = [
        ":proto_py",
    ],
    visibility = ["//visibility:public"],
)

# Configuration utilities
py_library(
    name = "configs",
    srcs = glob(["configs/**/*.py"]),
    visibility = ["//visibility:public"],
)
