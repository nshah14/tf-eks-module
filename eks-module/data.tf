# locals {
#   # Common tags to be assigned to all resources
#   cluster-name="terraform-eks"
# # }
# locals{
#   subnet_ids=["subnet-0a11d914ccd812ca4", "subnet-0ebd6c6e7cebe58b6"]
#   instance_type="t2.large"
#   name_prefix="tf"
#   image_id="ami-0199284372364b02a"
#   desired_capacity="2"
#   owner="673170749486"
#   max_size="2"
#   min_size="1"
#   env="Dev"
  
#   vpc_id = "vpc-0252ba718ca2924df"
# }

# data "cluster" "name" {
#  value = "terraform.eks"
# }