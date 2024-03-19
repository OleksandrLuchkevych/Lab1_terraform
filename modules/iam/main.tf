resource "aws_iam_role" "get_all_courses_role" {
 name = "get-all-courses-role"

assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_policy" "get_all_courses_police" {

  policy      = jsonencode({
        Version = "2012-10-17",
        Statement = [
        {
            Action = [
            "dynamodb:Scan",
            ],
            Effect   = "Allow",
            Resource = var.dynamodb_courses_arn
        },
        {
            Effect = "Allow",
            Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
            ],
            Resource = "*"
        }
        ]
    }) 
}

resource "aws_iam_role_policy_attachment" "get_all_courses_policy_attachment" {
  role        = aws_iam_role.get_all_courses_role.name
  policy_arn  = aws_iam_policy.get_all_courses_police.arn
}