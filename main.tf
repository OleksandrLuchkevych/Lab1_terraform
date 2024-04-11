module "table_authors" {
  source = "./modules/dynamodb"
  table_name = "authors"
}

module "table_courses" {
  source = "./modules/dynamodb"
  table_name = "courses"
}

module "iam" {
source = "./modules/iam"
  name   = "iam"

  dynamodb_authors_arn = module.table_authors.arn
  dynamodb_courses_arn = module.table_courses.arn
}


module "lambda" {
  source = "./modules/lambda"

  get_all_courses_arn = module.iam.get_all_courses_role_arn  
  get_all_authors_arn = module.iam.get_all_authors_role_arn
  save-course_arn = module.iam.save_course_role_arn
  update-course_arn = module.iam.update_course_role_arn
  get-course_arn = module.iam.get_course_role_arn
  delete-course_arn = module.iam.delete_course_role_arn
}

module "api" {
  source = "./modules/api"
 
    get_all_authors_arn = module.lambda.get_all_authors_arn
    get_all_authors_invoke_arn = module.lambda.get_all_authors_invoke_arn

    get_all_courses_arn = module.lambda.get_all_courses_arn
    get_all_courses_invoke_arn = module.lambda.get_all_courses_invoke_arn

    get_course_arn = module.lambda.get_course_arn
    get_course_invoke_arn = module.lambda.get_course_invoke_arn
}