FROM 172.30.33.31:5000/base/tomcat:8.5.15-8u74
COPY ContractMgt/target/ContractMgt.jar /opt/tomcat/webapps/
