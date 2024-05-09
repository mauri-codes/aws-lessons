import json

def PutBook(event, context):
   print(json.dumps(event))
   return {
      'statusCode': 200,
      'body': json.dumps('PutBook!')
   }

def PutPerson(event, context):
   print(json.dumps(event))
   return {
      'statusCode': 200,
      'body': json.dumps('PutPerson!')
   }

def BorrowBook(event, context):
   print(json.dumps(event))
   return {
      'statusCode': 200,
      'body': json.dumps('BorrowBook!')
   }

def PersonBooks(event, context):
   print(json.dumps(event))
   return {
      'statusCode': 200,
      'body': json.dumps('PersonBooks!')
   }

def PersonBooksByLib(event, context):
   print(json.dumps(event))
   return {
      'statusCode': 200,
      'body': json.dumps('PersonBooksByLib!')
   }

def ListBooks(event, context):
   print(json.dumps(event))
   return {
      'statusCode': 200,
      'body': json.dumps('ListBooks!')
   }
