resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = var.s3_bucket_name
  }
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket      = aws_s3_bucket.s3_bucket.id
  eventbridge = true
}