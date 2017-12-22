#!/usr/bin/env groovy
@Library('github.com/chinakevinguo/sharelibrary@master') _
def pipeline = new org.homework.Pipeline()
podTemplate(cloud: 'kubernetes',label: 'mypod',containers: [
    containerTemplate(name: 'jnlp', image: 'harbor.quark.com/quark/jnlp-slave:latest',workingDir: '/var/jenkins_home',privileged: true),
    containerTemplate(name: 'maven', image: 'harbor.quark.com/quark/maven:3.5-jdk-8' , ttyEnabled: true, command: 'cat',privileged: true)
    ],
    volumes : [
        [$class: 'HostPathVolume', mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'],
        // [$class: 'HostPathVolume', mountPath: '/home/jenkins', hostPath: '/data/jenkins'],
        // [$class: 'HostPathVolume', mountPath: '/home/qkuser/.m2', hostPath: '/data/maven_repo']
        [$class: 'PersistentVolumeClaim', mountPath: '/root/.m2', claimName: 'jenkins-m2-pvc', readOnly: false]
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
                sleep 120
                mvnPackage(config.args.mavenoptions)
              }
            }
        }
}
