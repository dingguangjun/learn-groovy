#!/usr/bin/env groovy
@Library('my-share-library') _
node {
  dockerNode(image: "docker.io/centos:7.3.1611") {
    stage('enheng') {
      echo "nimabi"
    }
  }
  stage('test') {
    echo "hhhhh"
  }
  stage('First stage') {
    dockerFingerprintFrom(dockerfile: "Dockerfile",image: "172.30.33.31:5000/base/tomcat:8.5.15-8u74")
    }
  stage('Second stage') {
    dockerFingerprintRun(containerId: "51a044045b31")
  }
}
