# Get All Courses
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


# Get All Authors
resource "aws_iam_role" "get_all_authors_role" {
 name = "get-all-authors-role"

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

resource "aws_iam_policy" "get_all_authors_police" {

  policy      = jsonencode({
          "Version": "2012-10-17",
          "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:Scan",
            "Resource": var.dynamodb_authors_arn
        }
    ]
    }) 
}

resource "aws_iam_role_policy_attachment" "get_all_authors_policy_attachment" {
  role        = aws_iam_role.get_all_authors_role.name
  policy_arn  = aws_iam_policy.get_all_authors_police.arn
}


# Save Course
resource "aws_iam_role" "save_course_role" {
 name = "save-course-role"

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

resource "aws_iam_policy" "save_course_police" {

  policy      = jsonencode({
          
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:PutItem",
            "Resource": var.dynamodb_courses_arn
        }
    ]          
    }) 
}

resource "aws_iam_role_policy_attachment" "save_course_police_attachment" {
  role        = aws_iam_role.save_course_role.name
  policy_arn  = aws_iam_policy.save_course_police.arn
}



# Update Course
resource "aws_iam_role" "update_course_role" {
 name = "update-course-role"

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

resource "aws_iam_policy" "update_course_police" {

  policy      = jsonencode({
          
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:PutItem",
            "Resource": var.dynamodb_courses_arn
        }
    ]          
    }) 
}

resource "aws_iam_role_policy_attachment" "update_course_police_attachment" {
  role        = aws_iam_role.update_course_role.name
  policy_arn  = aws_iam_policy.update_course_police.arn
}




# Get Courseg
resource "aws_iam_role" "get_course_role" {
 name = "get-course-role"

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


resource "aws_iam_policy" "get_course_police" {

  policy      = jsonencode({
   "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": "dynamodb:GetItem",
            "Resource": var.dynamodb_courses_arn
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "get_course_police_attachment" {
  role        = aws_iam_role.get_course_role.name
  policy_arn  = aws_iam_policy.get_course_police.arn
}

