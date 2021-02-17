data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}

data "vsphere_datastore" "datastore" {
  name          = "vsanDatastore"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Cluster1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "cluster01-segment-1"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "mongo-ubuntu-image"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "clustercontrol-mongo-test-01" {
  name             = "clustercontrol-mongo-test-01"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 16
  memory   = 32768
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  vapp {
    properties = {
      "hostname" = "clustercontrol-mongo-test-01",
      "public-keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNzYv4bC5mBsIE1tFbzd/7gK8hd8cr25ioZAmY4OP3rppyzJKN4cYn4Cctat/Nwj8xshH8YrwZNGFOPCCuP4uyzPnGk5y1w1hvw3kGXvH4hXL9mAWaKH/bJD6VSGCP/xN8/Y9zjO4UACgG7f6m7QWAPtYuNq3DatoTJbS6fMLwCXyqwtLaLKhJ7h7TzXgbcRh4amN95WCmalolsa+B7U1xcVd67yPq1RYK0BOncNtqqpxAJYQ7fOr6HA97s81IBANRsdrjY6dod9pGiTS+B60TBRbWdu8fGfn+qsC2tealM4aGcdzqJScW1+MqCVo4DaVpscQWs32QEcvN2fuldV2n ubuntu@clustercontrol"
    }
  }

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  cdrom {
    client_device = true
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

 }
}

resource "vsphere_virtual_machine" "clustercontrol-mongo-test-02" {
  name             = "clustercontrol-mongo-test-02"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 16
  memory   = 32768
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  vapp {
    properties = {
      "hostname" = "clustercontrol-mongo-test-02",
      "public-keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNzYv4bC5mBsIE1tFbzd/7gK8hd8cr25ioZAmY4OP3rppyzJKN4cYn4Cctat/Nwj8xshH8YrwZNGFOPCCuP4uyzPnGk5y1w1hvw3kGXvH4hXL9mAWaKH/bJD6VSGCP/xN8/Y9zjO4UACgG7f6m7QWAPtYuNq3DatoTJbS6fMLwCXyqwtLaLKhJ7h7TzXgbcRh4amN95WCmalolsa+B7U1xcVd67yPq1RYK0BOncNtqqpxAJYQ7fOr6HA97s81IBANRsdrjY6dod9pGiTS+B60TBRbWdu8fGfn+qsC2tealM4aGcdzqJScW1+MqCVo4DaVpscQWs32QEcvN2fuldV2n ubuntu@clustercontrol"   
    }
  }

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  cdrom {
    client_device = true
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

 }
}

resource "vsphere_virtual_machine" "clustercontrol-mongo-test-03" {
  name             = "clustercontrol-mongo-test-03"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 16
  memory   = 32768
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  vapp {
    properties = {
      "hostname" = "clustercontrol-mongo-test-03",
      "public-keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNzYv4bC5mBsIE1tFbzd/7gK8hd8cr25ioZAmY4OP3rppyzJKN4cYn4Cctat/Nwj8xshH8YrwZNGFOPCCuP4uyzPnGk5y1w1hvw3kGXvH4hXL9mAWaKH/bJD6VSGCP/xN8/Y9zjO4UACgG7f6m7QWAPtYuNq3DatoTJbS6fMLwCXyqwtLaLKhJ7h7TzXgbcRh4amN95WCmalolsa+B7U1xcVd67yPq1RYK0BOncNtqqpxAJYQ7fOr6HA97s81IBANRsdrjY6dod9pGiTS+B60TBRbWdu8fGfn+qsC2tealM4aGcdzqJScW1+MqCVo4DaVpscQWs32QEcvN2fuldV2n ubuntu@clustercontrol"
    }
  }

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  cdrom {
    client_device = true
  }

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

 }
}
