############
# S3 Bucket
############
resource "aws_s3_bucket" "ragedunicorn_knowledge" {
  bucket = "ragedunicorn-knowledge"
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

  tags = {
    Type         = "rg-generated"
    Organization = "ragedunicorn"
    Name         = "tf-ragedunicorn-knowledge"
    Description  = "Ragedunicorn base S3 knowledge bucket"
    Environment  = "prod"
  }
}
