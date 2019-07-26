output id {
  value       = aws_s3_bucket.default.id
  description = "ID of the bucket"
}

output arn {
  value       = aws_s3_bucket.default.arn
  description = "ARN of the bucket"
}
