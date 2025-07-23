
resource "aws_s3_bucket" "logs" {
  bucket = var.s3_logs_bucket_name
  force_destroy = true
}
