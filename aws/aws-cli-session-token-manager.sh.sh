#/bin/bash

echo https://gist.github.com/justinepoggi/45f4fc84a5b8f75dd3a32bb3bc3b5e3e
echo "-----------------------------"
echo "AWS CLI Session Token Manager"
echo "-----------------------------"
echo

function printUsage() {
        echo "The script '$0' requires two arguments:"
        echo ' - Your AWS MFA identifier, in the form: arn:aws:iam::189141687483:mfa/<USER>'
        echo ' - The number provided by your verification code provider (for example, Google Authenticator).'
}

function verifyEnvironment() {
        jq --version >> /dev/null
        returnCode=$?
        if [ $returnCode -ne 0 ]
        then
                echo 'This script requires jq to be installed: https://stedolan.github.io/jq/'
                exit 1
        fi
}

function cleanAwsEnvironmentVariables() {
        unset AWS_ACCESS_KEY_ID
        unset AWS_SECRET_ACCESS_KEY
        unset AWS_SESSION_TOKEN
}

function setAwsEnvironmentVariables() {
        aws sts get-session-token --serial-number $1 --profile=symphony-aws-dev --token-code $2 > /tmp/aws-cli-session-token.json
        returnCode=$?

        if [ $returnCode -eq 0 ]
        then
                awsAccessKeyId=$(cat /tmp/aws-cli-session-token.json | jq --raw-output .Credentials.AccessKeyId)
                export AWS_ACCESS_KEY_ID=$awsAccessKeyId

                awsSecretAccessKey=$(cat /tmp/aws-cli-session-token.json | jq --raw-output .Credentials.SecretAccessKey)
                export AWS_SECRET_ACCESS_KEY=$awsSecretAccessKey

                awsSessionToken=$(cat /tmp/aws-cli-session-token.json | jq --raw-output .Credentials.SessionToken)
                export AWS_SESSION_TOKEN=$awsSessionToken

                echo 'Environment variables set:'
                echo "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID"
                echo "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY"
                echo "AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN"

                echo 'AWS CLI session token successfully generated at:'
                date
        else
                echo 'Your AWS CLI session token could not be set.'
        fi
}

if [ $# -le 0 ]
then
        printUsage
else
        verifyEnvironment
        cleanAwsEnvironmentVariables
        setAwsEnvironmentVariables $*
fi
