#!/usr/bin/env groovy
@Library('my-share-library') _
node {
  stage('First stage') {
    withDockerContainer(image: "docker.io/centos:7.3.1611") {
      sh "echo hello world!"
    }
    }
}
