terraform {
  backend "s3" {
    bucket = vars.cf_r2_bucket
    key = "cffnpwr-home-iac.tfstate"
    region = "us-east-1"
    endpoints = {
      s3 = "https://${vars.cf_account_id}.r2.cloudflarestorage.com"
    }
    access_key = vars.cf_r2_access_key
    secret_key = vars.cf_r2_secret_key
    skip_credentials_validation = true
  }
}