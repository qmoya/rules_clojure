load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//deps:zip_repository.bzl", "zip_repository")

RULES_JVM_EXTERNAL_TAG = "6.2"
RULES_JVM_EXTERNAL_SHA = "aa39ecd47e16d5870eba817fe71476802bc371fe2724a2ddee565992df55f4af"

def rules_clojure_deps():
    maybe(
        zip_repository,
        name = "rules_clojure_maven_deps",
        path = "@rules_clojure//deps:rules_clojure_maven_deps.zip"
    )

    maybe(
        http_archive,
        name = "rules_jvm_external",
        strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
        sha256 = RULES_JVM_EXTERNAL_SHA,
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG
    )
