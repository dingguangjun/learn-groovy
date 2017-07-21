#!/usr/bin/env groovy
@Library('my-share-library') _
pipeline {
  agent {
    dockerfile  {
      image 'alpine:3.6'
      args '-v /tmp:/tmp'
      additionalBuildArgs '-t alpine:3.6'
    }
  }
  stages {
    stage('example build') {
      steps {
        echo 'Hello'
      }
    }
  }
}
