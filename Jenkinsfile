#!/usr/bin/env groovy
@Library('my-share-library') import org.foo.Utilities

def utils = new Utilities(steps)

node ('jenkins-slave-01'){
  utils.mvn 'clean package'
}
