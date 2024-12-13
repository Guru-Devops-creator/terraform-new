resource "aws_instance" "terraform-guru" {
    ami = "ami-09c813fb71547fc4f" #ami-09c813fb71547fc4f
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform-guru.id]
    tags = {
        Name = "terraform"
    }
    
}
 resource "aws_security_group" "allow_ssh_terraform-guru"{
    name = "allow_ssh"
    description = "allow port number 22 for ssh connections"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]

    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

      tags = {
        name = "allow_sshh"


}

}