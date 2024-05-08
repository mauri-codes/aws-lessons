resource "aws_api_gateway_rest_api" "api" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "example"
      version = "1.0"
    }
    paths = {
      "/path1" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
    }
  })

  name = "ApplicationAPI"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

data "template_file" "api_definition" {
  template = file("api.yaml")
  vars = {
    account_id = 
    aws_region =
    put_book = 
    
  }
}
