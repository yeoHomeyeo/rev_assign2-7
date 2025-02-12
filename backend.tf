#file: backend.tf

terraform {
  backend "s3" {
    bucket = "sctp-ce9-tfstate"
    key    = "chrisyeo-ce9-assign2_7.tfstate" # Replace the value of key to <your suggested name>.tfstat   
    region = "us-east-1"
  }
}
