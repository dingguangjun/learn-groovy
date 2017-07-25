#!/usr/bin/env groovy
@Library('my-share-library') _
node {
  stage('First stage') {
    docker.image("docker.io/centos:7.3.1611").dockerFingerprintFrom(image: "docker.io/centos:7.3.1611")
    }
}
