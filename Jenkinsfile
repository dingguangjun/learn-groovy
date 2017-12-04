#!/usr/bin/env groovy
podTemplate(cloud: 'kubernetes-test',label: 'mypod',containers: [
    containerTemplate(name: 'jnlp', image: 'harbor.quark.com/quark/jnlp-slave:alpine',workingDir: '/home/jenkins'),
    containerTemplate(name: 'docker', image: 'harbor.quark.com/quark/docker' , ttyEnabled: true, command: 'cat')
    ],
    volumes : [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
        ]) {
        node ('mypod') {
            stage('do some Docker worrk') {
              container('docker') {
                println 'hello world'
              }
            }
        }
}
