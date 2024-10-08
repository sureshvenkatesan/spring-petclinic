# Spring PetClinic Sample Application using JFrog CLI

## Prerequisites
- Read and understand the PetClinic application original documentation: [ReadME.MD](readme-original.md)
- Read and understand the PetClinic application jenkins pipeline documentation: [ReadME.MD](readme.md)

## Objective
Develop a DevOps pipeline to automate tasks such as code compile, unit testing, creation of container, and upload of artifacts to a repository. This will streamline the software development process using JFrog CLI.

Note: This process with not deploy to the envionrmnet platform. 



## Pipeline: GitHub Actions
### Maven
- [![JF-CLI with MVN](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-mvn.yml/badge.svg)](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-mvn.yml)
- [![JF-CLI with Maven and Xray](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-mvn-xray.yml/badge.svg)](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-mvn-xray.yml)
- [![JF-CLI with Maven and Docker](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-mvn-docker.yml/badge.svg)](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-mvn-docker.yml)
- [![JF-CLI with Maven, Docker, and Xray](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-mvn-docker-xray.yml/badge.svg)](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-mvn-docker-xray.yml)

### Gradle
- [![JF-CLI with Gradle](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-gradle.yml/badge.svg)](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-gradle.yml)
- [![JF-CLI with Gradle and Xray](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-gradle-xray.yml/badge.svg)](https://github.com/DayOne-Dev/spring-petclinic/actions/workflows/jfcli-gradle-xray.yml)

## Shell scripts
### Maven
- JF-CLI with Maven [jf-cli-mvn.sh](https://github.com/DayOne-Dev/spring-petclinic/blob/main/jf-cli-mvn.sh)
- JF-CLI with Maven + Xray [jf-cli-mvn-xray.sh](https://github.com/DayOne-Dev/spring-petclinic/blob/main/jf-cli-mvn-xray.sh)
- JF-CLI with Maven + Docker [jf-cli-mvn-docker.sh](https://github.com/DayOne-Dev/spring-petclinic/blob/main/jf-cli-mvn-docker.sh)
- JF-CLI with Maven + Docker + Xray [jf-cli-mvn-docker-xray.sh](https://github.com/DayOne-Dev/spring-petclinic/blob/main/jf-cli-mvn-docker-xray.sh)
### Gradle
- JF-CLI with Gradle [jf-cli-gradle.sh](https://github.com/DayOne-Dev/spring-petclinic/blob/main/jf-cli-gradle.sh)
- JF-CLI with Gradle + Xray [jf-cli-gradle-xray.sh](https://github.com/DayOne-Dev/spring-petclinic/blob/main/jf-cli-gradle-xray.sh)


## Pipeline: Jenkins
### MAVEN  
<img src="./cipipeline.svg">
- [pipeline file: Jenkins](./Jenkinsfile)
- [![Walk through demo](https://img.youtube.com/vi/zgiaPIp-ZZA/0.jpg)](https://www.youtube.com/watch?v=zgiaPIp-ZZA)



#### Error solutions
- <details><summary>Error: Exchanging JSON web token with an access token failed: getaddrinfo EAI_AGAIN access</summary>
    It is possbile that JF_RT_URL might be a NULL value. Ref [https://github.com/krishnamanchikalapudi/spring-petclinic/actions/runs/10892482444](https://github.com/krishnamanchikalapudi/spring-petclinic/actions/runs/10892482444)
</details>
- <details><summary>Error: </summary>
</details>



## LAST UMCOMMIT
`````
git reset --hard HEAD~1
git push origin -f
`````

## License
The Spring PetClinic sample application is released under version 2.0 of the [Apache License](https://www.apache.org/licenses/LICENSE-2.0).
