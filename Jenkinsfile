#!/usr/bin/env groovy
@Library('my-share-library') _
node {
  stage('First stage') {
    dockerFingerprintFrom(image: "centos:7.3.1611") {
      echo "hello ,haha"
    }
    }
}
