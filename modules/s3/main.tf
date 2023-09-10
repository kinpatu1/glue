resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

  bucket_key_enabled = false
  sse_algorithm = "AES256"
  region  = ap-northeast-1

  tags = {
    Name = var.s3_bucket_name
  }
}