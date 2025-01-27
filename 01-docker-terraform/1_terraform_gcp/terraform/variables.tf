variable "credentials" {
  description = "NY taxi Credentials"
  default     = "../keys/creds.json"
}

variable "project" {
  description = "Project"
  default     = "dtc-de-course-448810"
}

variable "region" {
  description = "Region"
  default     = "europe_central2"
}

variable "location" {
  description = "Project Location"
  default     = "EU"
}

variable "bq_dataset_name" {
  description = "NY taxi dataset"
  default     = "dtc_de_course_448810_ny_taxi_dataset"
}

variable "gcs_bucket_name" {
  description = "NY taxi Bucket"
  default     = "dtc_de_course_448810_ny_taxi_bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}