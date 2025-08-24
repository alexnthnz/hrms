# Root BUILD file for HRMS monorepo

load("@bazel_gazelle//:def.bzl", "gazelle")

# gazelle:prefix github.com/your-org/hrms
# gazelle:proto disable_global
gazelle(name = "gazelle")

# Update Go dependencies
gazelle(
    name = "gazelle-update-repos",
    args = [
        "-from_file=backend/go.mod",
        "-to_macro=deps.bzl%go_dependencies",
        "-prune",
    ],
    command = "update-repos",
)

# Convenience targets for building all services
alias(
    name = "all-backend",
    actual = "//backend:all",
)

alias(
    name = "all-frontend",
    actual = "//frontend:all",
)

# Development convenience targets
alias(
    name = "dev",
    actual = "//tools/scripts:dev-setup",
)

filegroup(
    name = "workspace-files",
    srcs = [
        "WORKSPACE",
        ".bazelrc",
        "BUILD",
    ],
    visibility = ["//visibility:public"],
)
