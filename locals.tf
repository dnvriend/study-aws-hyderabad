locals {
  # ---- network settings
  cidr_vpc       = "10.0.0.0/16"
  cidr_private_a = "10.0.0.0/24"
  cidr_private_b = "10.0.1.0/24"
  cidr_private_c = "10.0.2.0/24"
  cidr_public_a  = "10.0.10.0/24"
  cidr_public_b  = "10.0.11.0/24"
  cidr_public_c  = "10.0.12.0/24"

  # ---- dynamic availability zone settings
  az_a = "${local.settings[local.region_selected]["region"]}a"
  az_b = "${local.settings[local.region_selected]["region"]}b"
  az_c = "${local.settings[local.region_selected]["region"]}c"

  # ---- region specific settings
  settings = {
    hyderabad = {
      ami      = "ami-0000ec91aecb8f0fb" # AMZ Linux 2 ARM
      region   = "ap-south-2"
      instance = "t4g.nano" # $0.0028 / $ 0.000800
    }
    ireland = {
      ami      = "ami-006c19cfa0e8f4672" # AMZ Linux 2 ARM
      region   = "eu-west-1"
      instance = "t4g.nano" # $0.0046
    }
    london = {
      ami      = "ami-0b613b958a37cf7c3"
      region   = "eu-west-2"
      instance = "t4g.nano" # $0.0047
    }
    frankfurt = {
      ami      = "ami-087924c9e0410af37"
      region   = "eu-central-1"
      instance = "t4g.nano" # $0.0048
    }
    north-virginia = {
      ami      = "ami-01b5ec3ed8678d8b7"
      region   = "us-east-1"
      instance = "t4g.nano" # $0.0042
    }
    oregon = {
      ami      = "ami-0f96a89e4a6cf08cc"
      region   = "us-west-2"
      instance = "t4g.nano" # $0.0042
    }
  }

  region_selected = "hyderabad"

  # ---- name and tags
  name = "lavina-dennis-hyderabad"

  tags = {
    Provisioner = "Terraform"
    Region      = "Hyderabad"
    Date        = "2022-11-22"
  }
}
