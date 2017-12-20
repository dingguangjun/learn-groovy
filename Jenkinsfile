#!/usr/bin/env groovy
@Library('github.com/chinakevinguo/sharelibrary@master') _
def pipeline = new org.homework.Pipeline()
podTemplate(cloud: 'kubernetes-test',label: 'mypod',containers: [
    containerTemplate(name: 'jnlp', image: 'harbor.quark.com/quark/jnlp-slave:alpine',workingDir: '/home/jenkins',privileged: true),
    containerTemplate(name: 'maven', image: 'harbor.quark.com/quark/maven:3.5.0-8u74' , ttyEnabled: true, command: 'cat',privileged: true)
    ],
    volumes : [
        [$class: 'HostPathVolume', mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'],
        [$class: 'PersistentVolumeClaim', mountPath: '/home/jenkins', claimName: 'jenkins-slave-pvc'],
        [$class: 'PersistentVolumeClaim', mountPath: '/home/qkuser/.m2', claimName: 'jenkins-m2-pvc']
        ]) {
        node ('mypod') {

          checkout scm
            def config = readYaml file: 'Jenkinsfile.yaml'
            stage('checkout scm') {
              container('maven') {
                dir(config.git.gitlocal){
                  checkout([$class: 'GitSCM',
                  branches: [[name: config.git.gitbranch]],
                  doGenerateSubmoduleConfigurations: false,
                  extensions: [],
                  submoduleCfg: [],
                  userRemoteConfigs: [[credentialsId: config.git.gitcredentialsid,url: config.git.gitrepo]]])
                  }
              }
            }
            stage('build artifics') {
              container('maven') {
                mvnPackage(config.args.mavenoptions)
              }
            }
        }
}
