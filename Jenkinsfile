#!/usr/bin/env groovy
@Library('github.com/chinakevinguo/sharelibrary@master') _
def pipeline = new org.homework.Pipeline()
podTemplate(cloud: 'kubernetes-test',label: 'mypod',containers: [
    containerTemplate(name: 'jnlp', image: 'harbor.quark.com/quark/jnlp-slave:alpine',workingDir: '/home/jenkins',privileged: true),
    containerTemplate(name: 'maven', image: 'harbor.quark.com/quark/maven:3.5.0-8u74' , ttyEnabled: true, command: 'cat',privileged: true)
    ],
    volumes : [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
        hostPathVolume(mountPath: '/home/jenkins', hostPath: '/data/jenkins'),
        ]) {
        node ('mypod') {

          checkout scm
            def config = readYaml file: 'Jenkinsfile.yaml'
            stage('do some Docker worrk') {
              container('maven') {
                dir(config.git.gitlocal){
                  checkout([$class: 'GitSCM',
                  branches: [[name: config.git.gitbranch]],
                  doGenerateSubmoduleConfigurations: false,
                  extensions: [],
                  submoduleCfg: [],
                  userRemoteConfigs: [[credentialsId: config.git.gitcredentialsid,url: config.git.gitrepo]]])
                  }

                  mvnPackage(config.args.mavenoptions)
              }
            }
        }
}
