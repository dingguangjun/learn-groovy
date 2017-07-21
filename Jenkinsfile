#!/usr/bin/env groovy
@Library('my-share-library') _
pipeline {
  agent {
    dockerfile  {
      label 'my-define-docker'
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
