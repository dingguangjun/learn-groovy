#!/usr/bin/env groovy
@Library('my-share-library') import org.foo.Utilities

def utils = new Utilities(steps)

node {
  utils.mvn 'clean package'
}
