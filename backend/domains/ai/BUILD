# AI Domain - Python-based machine learning and AI services

load("@rules_python//python:defs.bzl", "py_library")

# All AI domain services (Python-based)
filegroup(
    name = "all",
    srcs = [
        "//backend/domains/ai/services/ml-service:all",
        "//backend/domains/ai/services/nlp-service:all", 
        "//backend/domains/ai/services/recommendation-service:all",
    ],
    visibility = ["//backend:__pkg__"],
)

# Shared libraries for AI domain
py_library(
    name = "ai_common",
    srcs = glob(["internal/**/*.py"]),
    deps = [
        "@python_deps//fastapi",
        "@python_deps//torch",
        "@python_deps//transformers", 
        "@python_deps//scikit_learn",
        "@python_deps//numpy",
        "@python_deps//pandas",
        "//shared:proto_py",
        "//shared:events",
    ],
    visibility = ["//backend/domains/ai:__subpackages__"],
)
