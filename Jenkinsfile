#!/usr/bin/env groovy
@Library('my-share-library') _
pipeline {
  agent {
    dockerfile  {
      args "-v /tmp:/tmp"
      label "docker-nodes"
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
