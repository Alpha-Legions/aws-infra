resource "aws_key_pair" "deployer" {
  key_name   = "ec2-ub"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCveZqnIs4Dc8HoMmy4EHJFUUqWTZbi1DqnpJV5ZCBYPS0KXf3uZTN4Vs983Eux95mGQd6ODJgC8JNjuuQhYXZyRwXA9NeZodT8cxPFOLWfgxpht2LLUdk23datCrBN5uWiNTsZx4M459uhgWhkoZSMAvJOuAMOir0rlYwpv05H8YXu1CY9TTVEXJ9vakA4q2iwh2WEP5/PBpF5mwEgi+i18cJfTTO47t9canB91mXspDlAJXjX+8ccW1q2WX2IjLxOEvchp9wysqX69gsWEn5wQCTcIDvu7iEjmApr3Kww6+yVY9m0rAwqp+CdkYdfcXWblsZxKXy5DMUXGsHHs9gi6wwOKRXoHewT8K+dpEre9J/I5CwFupIvgHoHt1YXwSuuNjZRla/oseOubTUV8sitOf1M4jHpG+cl65cKb33PY1iHBP5ktCDIpby24MFzqaaI0wgbWXjCgISzYIVpw+bwhKj/yJBpJW8GSaT0CtJoyv3MJYl6g+JQukNYs+ofTIs= ace@DESKTOP-NFSV25F"
}

# resource "aws_instance" "ec2_instance" {
#   ami                     = var.ami_id
#   instance_type           = var.instance_type
#   subnet_id               = aws_subnet.public_subnets[0].id
#   vpc_security_group_ids  = [aws_security_group.security_group.id]
#   key_name                = aws_key_pair.deployer.key_name
#   disable_api_termination = false
#   depends_on = [
#     aws_security_group.security_group
#   ]
#   root_block_device {
#     volume_size = var.instance_volume_size
#     volume_type = var.instance_volume_type
#   }
#   iam_instance_profile = aws_iam_instance_profile.EC2-CSYE6225_instance_profile.name
#   tags = {
#     Name = "Webapp Instance"
#   }
#   user_data = <<EOF
#     #!/bin/bash
#     echo "[Unit]
#     Description=Webapp Service
#     After=network.target

#     [Service]
#     Environment="DB_HOST=${element(split(":", aws_db_instance.main.endpoint), 0)}"
#     Environment="DB_USER=${aws_db_instance.main.username}"
#     Environment="DB_PASSWORD=${aws_db_instance.main.password}"
#     Environment="DB_DATABASE=${aws_db_instance.main.db_name}"
#     Environment="AWS_BUCKET_NAME=${aws_s3_bucket.private.id}"
#     Environment="AWS_REGION=${var.region}"
#     Type=simple
#     User=ec2-user
#     WorkingDirectory=/home/ec2-user/webapp
#     ExecStart=/usr/bin/node /home/ec2-user/webapp/index.js
#     Restart=on-failure

#     [Install]
#     WantedBy=multi-user.target" > /etc/systemd/system/webapp.service
#     sudo systemctl daemon-reload
#     sudo systemctl start webapp.service
#     sudo systemctl enable webapp.service
#   EOF
# }

resource "aws_iam_instance_profile" "EC2-CSYE6225_instance_profile" {
  name = "EC2-CSYE6225_Role_Instance_profile"
  role = aws_iam_role.EC2-CSYE6225.name
}

# Environment="AWS_ACCESS_KEY_ID=${var.AWS_ACCESS_KEY_ID}"
# Environment="AWS_SECRET_ACCESS_KEY=${var.AWS_SECRET_ACCESS_KEY}"