
resource "aws_dynamodb_table" "security_logs" {
  name         = var.ddb_security_logs_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LogID"

  attribute {
    name = "LogID"
    type = "S"
  }

  tags = {
    Environment = "prod"
  }
}
