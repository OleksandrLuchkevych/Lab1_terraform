output "get_all_authors_arn" {
  value = aws_lambda_function.get_all_authors.arn
}
output "get_all_authors_invoke_arn" {
  value = aws_lambda_function.get_all_authors.invoke_arn
}

output "get_all_courses_arn" {
  value = aws_lambda_function.get_all_courses.arn
}
output "get_all_courses_invoke_arn" {
  value = aws_lambda_function.get_all_courses.invoke_arn
}

output "get_course_arn" {
  value = aws_lambda_function.get-course.arn
}
output "get_course_invoke_arn" {
  value = aws_lambda_function.get-course.invoke_arn
}