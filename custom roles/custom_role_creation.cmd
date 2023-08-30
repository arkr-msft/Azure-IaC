//Custom role creation commands

//Create role
az role definition create --role-definition CustomRole-Cognitive-Services-OpenAI-User.json
az role definition create --role-definition CustomRole-SupportEngg-AOAI.json

//Update role
az role definition update --role-definition CustomRole-Cognitive-Services-OpenAI-User.json
az role definition update --role-definition CustomRole-SupportEngg-AOAI.json

//Delete role
az role definition delete --name <CustomRoleName>

//Show currently logged in user
az account show

//Get access token for setting environment variable
az account get-access-token

//Set environment variable in CLI
set OPENAI_API_KEY=xxxxxxxxxxxxx

//Test Env variable
echo %OPENAI_API_KEY%
