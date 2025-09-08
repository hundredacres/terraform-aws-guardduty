module "standalone_guardduty" {
  source = "../../.."

  enable_guardduty              = true
  enable_s3_protection          = true
  enable_rds_protection         = true
  enable_lambda_protection      = true
  enable_kubernetes_protection  = true
  enable_eks_runtime_monitoring = true
  enable_ecs_runtime_monitoring = true
  enable_ec2_runtime_monitoring = true
  enable_malware_protection     = true
  enable_snapshot_retention     = true
  finding_publishing_frequency  = "FIFTEEN_MINUTES"
  tags                          = {}
}
