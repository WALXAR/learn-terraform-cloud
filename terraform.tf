terraform {

#   cloud {
#     organization = "Walxar"

#     workspaces {
#       name = "learn-terraform-cloud"
#     }
#   }

   required_providers {
     azurerm = {
       source = "hashicorp/azurerm"
       version = "3.55.0"
     }
   }

   required_version = ">= 0.14.0"
 }
