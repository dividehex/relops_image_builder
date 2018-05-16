
resource "aws_iam_user" "relops_image_builder" {
  name = "relops_image_builder"
  path = "/"
}

resource "aws_iam_user_policy" "s3_relop_image_builder" {
  name = "RelopImageBuilderS3AccessBucket"
  user = "${aws_iam_user.relops_image_builder.name}"
  policy = "${data.aws_iam_policy_document.allow_s3_rw_relops_image_builder_bucket.json}"
}

data "aws_iam_policy_document" "allow_s3_rw_relops_image_builder_bucket" {
  statement {
    actions = [
      "s3:*",
    ]

    resources = [
      "${aws_s3_bucket.relops_image_builder.arn}/*",
    ]
  }
}
