#Create multiple VM instances at once using count.
terraform {
  required_version = ">=1.12.0"

  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~>5.0"
    }
  }
}
provider "google" {
    project = "academic-veld-465813-n7"
    region = "us-east1"
    zone = "us-east1-c"
  
}
resource "google_compute_instance" "vm1" {
    count = var.count_no
    name = "vme-${count.index + 1}"
    zone = "us-east1-c"
    machine_type = "e2-micro"
    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-11"

      }
    }
    network_interface {
      network = "default"
      access_config {
        //
      }
    }
  
}
variable "count_no" {
    type = number
    default = 4
  
}