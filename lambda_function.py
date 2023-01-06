import json
import boto3
import zlib
import base64
import json


client_sns = boto3.client('sns')

def lambda_handler(event, context):
    # TODO implement
    
    print(event['awslogs']['data'])
    json_str = zlib.decompress(base64.b64decode(event['awslogs']['data']), 16 + zlib.MAX_WBITS).decode('utf-8')
    json_event=json.loads(json_str)
    
    print(json_event['logEvents'][0]['message'])
    client_sns.publish(
      TopicArn="arn:aws:sns:us-east-1:xxxxxxxxxxxx:mail1045",
      Message=str(json_event['logEvents'][0]['message'])
      )