#!/usr/bin/env groovy
@Library('my-share-library') _
node {
  stage('First stage') {
    docker.dockerFingerprintFrom([dockerfile: "."])
  }
}
