#!/usr/bin/env groovy
@Library('my-share-library') _
node {
  stage('First stage') {
    dockerFingerprintFrom(dockerfile: "Dockerfile",image: "alpine:3.6")
    }
}
