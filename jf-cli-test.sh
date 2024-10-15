# SET meta-data to differentiate application category, such as application or internal-library
# export PACKAGE_CATEGORIES=(WEBAPP, SERVICE, LIBRARY, BASEIMAGE)
clear
# TOKEN SETUP
# jf c add --user=krishnam --interactive=true --url=https://psazuse.jfrog.io --overwrite=true 

rm -rf target && rm -rf build

# Config - Artifactory info
export JF_HOST="psazuse.jfrog.io"  JFROG_RT_USER="krishnam" JFROG_CLI_LOG_LEVEL="DEBUG" # JF_ACCESS_TOKEN="<GET_YOUR_OWN_KEY>"
export JF_RT_URL="https://${JF_HOST}"
export RT_REPO_VIRTUAL="krishnam-mvn-virtual"

echo "JF_RT_URL: $JF_RT_URL \n JFROG_RT_USER: $JFROG_RT_USER \n JFROG_CLI_LOG_LEVEL: $JFROG_CLI_LOG_LEVEL \n "

## Health check
jf rt ping --url=${JF_RT_URL}/artifactory

# MVN 
## Config - project
### CLI
export BUILD_NAME="spring-petclinic" BUILD_ID="cmd.mvn.xray.$(date '+%Y-%m-%d-%H-%M')" 

### Jenkins
# export BUILD_NAME=${env.JOB_NAME} BUILD_ID=${env.BUILD_ID} 
# References: 
# https://www.jenkins.io/doc/book/pipeline/jenkinsfile/#using-environment-variables 
# https://wiki.jenkins.io/JENKINS/Building+a+software+project 

echo " BUILD_NAME: $BUILD_NAME \n BUILD_ID: $BUILD_ID \n JFROG_CLI_LOG_LEVEL: $JFROG_CLI_LOG_LEVEL  \n RT_PROJECT_REPO: $RT_PROJECT_REPO  \n "
jf mvnc --global --repo-resolve-releases ${RT_REPO_VIRTUAL} --repo-resolve-snapshots ${RT_REPO_VIRTUAL} 

## Create Build
echo "\n\n**** MVN: Package ****\n\n" # --scan=true
jf mvn clean install -DskipTests=true --build-name=${BUILD_NAME} --build-number=${BUILD_ID} --detailed-summary=true 

echo "\n\n**** CDX file:"
ls -lrt ./target/classes/META-INF/sbom/

## XRAY sbom enrich    ref# https://docs.jfrog-applications.jfrog.io/jfrog-applications/jfrog-cli/cli-for-jfrog-security/enrich-your-sbom
# # find . -iname "*.cdx.json"      
echo "\n\n**** [XRAY] sbom enrich ****"
jf se "./target/classes/META-INF/sbom/application.cdx.json" > target/classes/META-INF/sbom/application.cdx-enrich.json

echo "\n\n**** CDX files:"
ls -lrt ./target/classes/META-INF/sbom/


echo "\n\n**** DONE ****\n\n"