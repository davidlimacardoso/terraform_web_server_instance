
resource "aws_instance" "infra_web_prd" {
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id = var.subnetId
  associate_public_ip_address = true
  
  #User data make web aplication httpd
  user_data = file("user_data/user_data.txt")
  
  # root disk
  root_block_device {
    volume_size           = "8"
    volume_type           = "gp2"
    encrypted             = true
    # kms_key_id            = aws_kms_key.kopi-kms-key.key_id      
    delete_on_termination = true
  }
 
  tags = {
    Tribe = "devOps"
  }
}

#Instance status
resource "aws_ec2_instance_state" "infra_web_prd_instance_status" {
  instance_id = aws_instance.infra_web_prd.id
  state       = "running"

}

#Create Security Group
resource "aws_security_group" "allow_access_pub_sg" {
  name        = "allow_pub_test"
  description = "Allow public access to inbound traffic"
  vpc_id      = var.vpcId
  
  dynamic "ingress" {
    for_each = toset(var.multIngressSg)
    
    content {
      description      = ingress.value.description
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
    }
   
  }
}

#Attach Security Group
resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.allow_access_pub_sg.id
  network_interface_id = aws_instance.infra_web_prd.primary_network_interface_id
}
