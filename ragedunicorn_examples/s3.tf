############
# S3 Bucket
############
resource "aws_s3_bucket" "state_store" {
  bucket = "ragedunicorn-examples"
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags {
    Name        = "tf-ragedunicorn-examples"
    Description = "Ragedunicorn S3 examples bucket"
    Environment = "Prod"
  }
}
