#!/usr/bin/env groovy
@Library('my-share-library') _
pipeline {
  agent { dockerfile  {additionalBuildArgs '-t alpine:3.6'} }
  stages {
    stage('example build') {
      steps {
        echo 'Hello'
      }
    }
  }
}
