resource "aws_ebs_volume" "chrisy_ebs" {
  availability_zone = var.myaz_one
  size              = 1 # 1GiB 

#default type = "gp2" (General Purpose SSD) 

  tags = {
    Name = "chrisy-ebs-11feb25"
  }
}

resource "aws_volume_attachment" "chrisy-ebs-11feb25" {
  device_name = "/dev/sdu" # xvda already in use
  volume_id   = aws_ebs_volume.chrisy_ebs.id
  instance_id = aws_instance.public.id 
}