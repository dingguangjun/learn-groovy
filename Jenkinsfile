#!/usr/bin/env groovy
podTemplate(cloud: 'kubernetes-test',label: 'mypod',containers: [
    containerTemplate(name: 'docker', image: 'docker' , ttyEnabled: true, command: 'cat')
    ],
    volumes : [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
        ]) {
        node ('mypod') {
            stage('do some Docker worrk') {
                sh 'echo hello world'
            }
        }
}
