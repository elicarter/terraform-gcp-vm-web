provider "google" {
  project = "acme-tfc-demo" 
  region  = "us-west3"
}


resource "google_compute_instance" "vm_instance" {
  count         = var.instance_count
  name          = "acmewebserver-${count.index + 1}"
  machine_type = var.gcp_instance_type
  zone         = "us-west3-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
