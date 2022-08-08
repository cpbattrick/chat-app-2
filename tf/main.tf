provider "aws" {
  region     = "eu-west-2"
  access_key = ""
  secret_key = ""
}

resource "aws_apigatewayv2_api" "main" {
  name                       = "test-websocket-api"
  description                = "Websocket on AWS Simple Testing"
  protocol_type              = "WEBSOCKET"
  route_selection_expression = "$request.body.action"
}

resource "aws_apigatewayv2_integration" "lambda_main" {
  api_id             = aws_apigatewayv2_api.main.id
  integration_uri    = aws_lambda_function.main.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "_connect" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "$connect"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_main.id}"
}

resource "aws_apigatewayv2_route" "_disconnect" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "$disconnect"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_main.id}"
}

resource "aws_apigatewayv2_route" "_default" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_main.id}"
}

resource "aws_apigatewayv2_route" "sendPrivate" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "sendPrivate"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_main.id}"
}

resource "aws_apigatewayv2_route" "sendPublic" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "sendPublic"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_main.id}"
}

resource "aws_apigatewayv2_route" "setName" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "setName"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_main.id}"
}

resource "aws_apigatewayv2_route" "getLogs" {
  api_id    = aws_apigatewayv2_api.main.id
  route_key = "getLogs"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_main.id}"
}


resource "aws_apigatewayv2_stage" "lambda" {
  api_id      = aws_apigatewayv2_api.main.id
  name        = "primary"
  auto_deploy = true
}

resource "aws_lambda_permission" "api_gw_main_lambda_main" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.main.execution_arn}/*/*"
}

# lambda

resource "aws_iam_role" "lambda_main" {
  name               = "test-websocket-api"
  assume_role_policy = data.aws_iam_policy_document.lambda_fn_assume_role.json
}

resource "aws_lambda_function" "main" {
  function_name = "websocket-lambda"
  handler       = "aws_simple_websocket.handler.handler"
  role          = aws_iam_role.lambda_main.arn
  runtime       = "nodejs12.x"

  timeout = 10

  filename = "./index.zip"
}

data "aws_iam_policy_document" "lambda_fn_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
  }
}

resource "aws_dynamodb_table" "chat_log_table" {
  name           = "chat-log-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = "30"
  write_capacity = "30"
  attribute {
    name = "user"
    type = "S"
  }
  hash_key = "user"
  ttl {
    enabled        = true
    attribute_name = "expiryPeriod"
  }
}






