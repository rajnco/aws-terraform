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

resource "random_integer" "less_than_10" {
  min = 1
  max = 10
}

variable "pet_count" {
  description = "The number of random pet names to generate."
  type        = number
  default     = "${var.random_integer.less_than_10.result}"
  validation {
    condition     = var.pet_count > 0 && var.pet_count <= 10
    error_message = "The pet_count variable must be greater than zero and less than or equal to 10."
  }
}

resource "random_pet" "multiple_names" {
  count     = var.pet_count
  length    = 5
  separator = "-"
}




