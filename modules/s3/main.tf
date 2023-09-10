resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

            server_side_encryption_configuration [
              {
                "rule": [
                  {
                    "apply_server_side_encryption_by_default": [
                      {
                        "kms_master_key_id": "",
                        "sse_algorithm": "AES256"
                      }
                    ],
                    "bucket_key_enabled": false
                  }
                ]
              }
            ]

  tags = {
    Name = var.s3_bucket_name
  }
}