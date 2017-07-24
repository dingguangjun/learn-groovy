#!/usr/bin/env groovy
@Library('my-share-library') _
pipeline {
  agent {
    dockerfile  {
      args "-v /tmp:/tmp"
    }
  }
  stages {
    stage('example build') {
      steps {
        echo "Hello,my World!"
      }
    }
  }
}
