############
# S3 Bucket
############
resource "aws_s3_bucket" "ragedunicorn_video" {
  bucket = "ragedunicorn-video"
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
    Name         = "tf-ragedunicorn-video"
    Description  = "Ragedunicorn S3 video bucket"
    Environment  = "prod"
  }
}
