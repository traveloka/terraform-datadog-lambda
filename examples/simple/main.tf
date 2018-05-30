module "lambda" {
  source         = "../../"
  product_domain = "BEI"
  service        = "beical"
  function_name  = "beical-function"
  environment    = "production"

  recipients = ["slack-bei", "pagerduty-bei", "bei@traveloka.com"]
}
