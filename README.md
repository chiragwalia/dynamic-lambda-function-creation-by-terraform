# dynamic-lambda-function-creation-by-terraform
This project gives a simple demo of automating and dynamic creation of serverless architecture for log validation using terraform


The requirment of this project was to automate the process of creating lambda functions for different cloud watch logs.

Things that were done:-
 1. Create Lambda functions to capture error in cloud watch logs and then forward the request to sns to recieve mail, when error was being found in cloud       watch logs. 
 
 2. Used terraform to easily create the infrastructure, So as removing the need to provision lambda instances manually.
