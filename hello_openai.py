#Sample file to call the Azure OpenAI APIs
#Prerequisites: gpt-35-turbo engine should be created in the Azure OpenAI resource
#Note: The openai-python library support for Azure OpenAI is in preview.
import os
import openai
from azure.identity import DefaultAzureCredential
openai.api_type = "azure_ad"
openai.api_base = f"https://arkr-msft-cogsvc-eus2.openai.azure.com/"
openai.api_version = "2023-07-01-preview"

print("getting azure credential of currently logged user in command prompt. Prerequisite excute command 'az login' to login to Azure CLI")

azure_credential = DefaultAzureCredential(exclude_shared_token_cache_credential = True)

openai.api_key = azure_credential.get_token("https://cognitiveservices.azure.com/.default").token

print("Getting chat response from OpenAI")
response = openai.ChatCompletion.create(
  engine="gpt-35-turbo",
  messages = [{"role":"user","content":"summarize \"dalia’s storm surge was record-breaking from Tampa to the Big Bend.\n\nMore than 8 feet of storm surge sent water levels in Cedar Key, Florida, to 6.8 feet above their highest normal tides on Wednesday morning. This shattered the previous high water level of 5.99 feet from Hurricane Hermine in 2016.\n\nIn Tampa Bay, water levels surpassed 4.5 feet on Wednesday morning, exceeding the previous high water mark of 3.79 feet from Tropical Storm Eta in 2020.\n\nClearwater Beach also set a new record-high water level at 4.05 feet, surpassing the previous record of 4.02 feet from the 1993 Storm of the Century.\n\nStorm surge rushing through the Steinhatchee River in Steinhatchee, Florida, also caused water levels there to rise 9 feet in two hours and hit record levels there.\""},{"role":"assistant","content":"Summary: Dalia's storm surge resulted in record-breaking water levels from Tampa to the Big Bend in Florida. Cedar Key experienced a surge of over 8 feet, surpassing the previous high water level set by Hurricane Hermine in 2016. Tampa Bay saw water levels exceeding 4.5 feet, breaking the previous record set by Tropical Storm Eta in 2020. Clearwater Beach also experienced a new record-high water level, surpassing the previous record from the 1993 Storm of the Century. Additionally, the Steinhatchee River in Steinhatchee, Florida, saw a surge that caused water levels to rise 9 feet in two hours, reaching record levels."}],
  temperature=0.7,
  max_tokens=800,
  top_p=0.95,
  frequency_penalty=0,
  presence_penalty=0,
  stop=None)

print("Chat response received from OpenAI:")
print(response)
print("end of program")
