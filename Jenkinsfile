#!/usr/bin/env groovy
@Library('my-share-library') import org.foo.*

def utils = new Utilities(steps)
def z = new Zot()

node ('jenkins-slave-01'){
  z.checkOutFrom('bizappForNDes')
  utils.mvn 'clean package'
}
