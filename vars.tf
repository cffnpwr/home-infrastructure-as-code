variable "cf_account_id" {
  type = string
}
variable "cf_r2_bucket" {
  type = string
  default = "tfstate"
}
variable "cf_r2_access_key" {
  type = string
  sensitive = true
}
variable "cf_r2_secret_key" {
  type = string
  sensitive = true
}