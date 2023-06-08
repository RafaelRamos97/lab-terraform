resource "aws_s3_bucket" "buket-inicial" {
  bucket = "bucket-rafael-santana"

  tags = {
    Environment = "Dev"
  }
}