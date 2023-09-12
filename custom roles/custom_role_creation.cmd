//Custom role creation commands

// Reference documentation: 
// https://learn.microsoft.com/en-us/azure/role-based-access-control/custom-roles-cli

// Permissions available for each resource provider:
// https://learn.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations

//Create role
az role definition create --role-definition CustomRole-Cognitive-Services-OpenAI-User.json
az role definition create --role-definition CustomRole-SupportEngg-AOAI.json

//Update role
//generate existing definition and save to json file (remove square brackets from saved file)
az role definition list --name CustomRole-Cognitive-Services-OpenAI-User.json > CustomRole-Cognitive-Services-OpenAI-User-update.json



//add new permissions to the json file and then execute the update command
az role definition update --role-definition CustomRole-Cognitive-Services-OpenAI-User-update.json


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
