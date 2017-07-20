#!/usr/bin/env groovy
@Library('my-share-library') _
// import org.foo.Zot
// import static org.foo.Utilities.*
// // def utils = new Utilities(steps)
// def z = new Zot()

pipeline{
  agent any
  stages {
    stage ('test') {
      steps {
        echo "hello"
        script {
          acme.name = 'Alice'
          echo acme.name
          acme.caution 'The queen is angry!'
        }
      }
    }
  }
  // z.checkOutFrom('http://git.quarkfinance.com/payday-loan/bizappForNDes.git')
  // utils.mvn 'clean package'
  // mvn this, 'clean package'
}
