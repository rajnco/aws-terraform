terraform {
  required_version = ">= 1.0.0"
  cloud {
    organization = "rajnco"
    workspaces {
      name = "aws-terraform"
    }
  }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}


resource "random_pet" "name" {
  length    = 2
  separator = "-"
}

resource "random_integer" "number" {
  min = 1000
  max = 9999
}

resource "local_file" "example" {
  content  = "Hello, ${random_pet.name.id}-${random_integer.number.result}!"
  filename = "${path.module}/hello.txt"
}

resource "random_integer" "random_integer_10" {
  min = 1
  max = 10
}

resource "random_pet" "multiple_names" {
  count     = 10
  length    = 5
  separator = "-"
}

