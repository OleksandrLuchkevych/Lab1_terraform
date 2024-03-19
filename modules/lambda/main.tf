
data "archive_file" "get_all_courses" {
    type = "zip"

    source_file  = "modules/lambda/functions/get_all_courses/get_all_courses.js" 
    output_path  = "modules/lambda/functions/get_all_courses/get_all_courses.zip" 
}


resource "aws_lambda_function" "get_all_courses" {
 filename         = data.archive_file.get_all_courses.output_path
 function_name   = "get_all_courses"
 role            =  var.get_all_courses_arn
 handler         = "get_all_courses.handler"
 runtime         = "nodejs16.x"
}