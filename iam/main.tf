provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_user" {
  name = "user"
}

resource "aws_iam_policy" "custom_policy" {
  name = "GlacierEFSEC2"

    policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"glacier:InitiateJob",
				"glacier:AbortMultipartUpload",
				"ec2:DeleteTags",
				"glacier:ListTagsForVault",
				"glacier:CreateVault",
				"glacier:DeleteVault",
				"ec2:CreateTags",
				"glacier:DeleteArchive",
				"glacier:ListParts",
				"glacier:DeleteVaultNotifications",
				"glacier:ListJobs",
				"glacier:ListMultipartUploads",
				"glacier:SetVaultNotifications",
				"glacier:CompleteMultipartUpload",
				"glacier:InitiateMultipartUpload",
				"glacier:UploadMultipartPart",
				"glacier:PurchaseProvisionedCapacity",
				"glacier:UploadArchive",
				"glacier:ListVaults",
				"glacier:ListProvisionedCapacity"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy_attachment" "policy_binding" {
  name = "attach"
  users = [aws_iam_user.my_user.name]
  policy_arn = aws_iam_policy.custom_policy.arn
}