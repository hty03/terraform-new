
output "ddb_table_arn" {
  value = aws_dynamodb_table.security_logs.arn
}
