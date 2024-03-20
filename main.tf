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
}