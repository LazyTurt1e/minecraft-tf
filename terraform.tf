terraform {
  backend "s3" {
    bucket         = "mark-playground-tn-tfstate"
    dynamodb_table = "mark-playground-tn-tfstate"
    region         = "eu-central-1"
    key            = "remote-tftstate/wtoorren-mc-server/tfstate"
  }
}
