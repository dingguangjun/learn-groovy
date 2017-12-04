#!/usr/bin/env groovy
podTemplate(cloud: 'kubernetes-test',label: 'mypod',containers: [
    containerTemplate(name: 'jnlp', image: 'harbor.quark.com/quark/jnlp-slave:alpine',workingDir: '/home/jenkins'),
    containerTemplate(name: 'docker', image: 'harbor.quark.com/quark/docker' , ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'kubectl', image: 'harbor.quark.com/quark/k8s-kubectl:v1.8.4', command: 'cat', ttyEnabled: true)
    ],
    volumes : [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
        ]) {
        node ('mypod') {
            stage('do some Docker worrk') {
              container('docker') {

                withCredentials(
                  [[$class: 'UsernamePasswordMultiBinding',
                    credentialsId: 'harbor',
                    usernameVariable: 'HARBOR_USER',
                    passwordVariable: 'HARBOR_PASSWORD'
                  ]]) {
                    sh """
                    docker pull ubuntu
                    docker tag ubuntu harbor.quark.com/quark/ubuntu:${env.BUILD_NUMBER}
                       """
                    sh "docker login harbor.quark.com -u ${env.HARBOR_USER} -p ${env.HARBOR_PASSWORD}"
                    sh "docker push harbor.quark.com/quark/ubuntu:${env.BUILD_NUMBER}"
                  }
              }
            }
            stage('do some kubectl work') {
              container('kubectl') {
                [[$class: 'UsernamePasswordMultiBinding',
                  credentialsId: 'aafa2b67-5f80-4441-97d1-76cf7dd4739d'
                ]]) {
                  sh "kubectl get nodes"
                }

              }
            }
        }
}
