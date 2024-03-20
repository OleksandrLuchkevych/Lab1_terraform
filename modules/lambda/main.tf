# Get All Courses
data "archive_file" "get_all_courses" {
    type = "zip"

    source_file  = "modules/lambda/functions/get-all-courses/get-all-courses.js" 
    output_path  = "modules/lambda/functions/get-all-courses/get-all-courses.zip" 
}


resource "aws_lambda_function" "get_all_courses" {
 filename         = data.archive_file.get_all_courses.output_path
 function_name   = "get-all-courses"
 role            =  var.get_all_courses_arn
 handler         = "get-all-courses.handler"
 runtime         = "nodejs16.x"
}

# Get All Authors
data "archive_file" "get_all_authors" {
    type = "zip"

    source_file  = "modules/lambda/functions/get-all-authors/get-all-authors.js" 
    output_path  = "modules/lambda/functions/get-all-authors/get-all-authors.zip" 
}


resource "aws_lambda_function" "get_all_authors" {
 filename         = data.archive_file.get_all_authors.output_path
 function_name   = "get-all-authors"
 role            =  var.get_all_authors_arn
 handler         = "get-all-authors.handler"
 runtime         = "nodejs16.x"
}


# Save Courses
data "archive_file" "save-course" {
    type = "zip"

    source_file  = "modules/lambda/functions/save-course/save-course.js" 
    output_path  = "modules/lambda/functions/save-course/save-course.zip" 
}


resource "aws_lambda_function" "save-course" {
 filename         = data.archive_file.save-course.output_path
 function_name   = "save-course"
 role            =  var.save-course_arn
 handler         = "save-course.handler"
 runtime         = "nodejs16.x"
}