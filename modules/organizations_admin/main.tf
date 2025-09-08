##################################################
# GuardDuty Organizations Delegated Admin
##################################################
resource "aws_guardduty_organization_admin_account" "this" {
  count            = var.admin_account_id == null ? 0 : 1
  admin_account_id = var.admin_account_id
}

resource "aws_guardduty_organization_configuration" "this" {
  count = var.admin_account_id == null ? 0 : 1

  auto_enable_organization_members = var.auto_enable_org_config != null ? null : var.auto_enable_organization_members
  detector_id                      = var.guardduty_detector_id
}

##################################################
# Amazon S3 Protection
##################################################
resource "aws_guardduty_organization_configuration_feature" "s3_protection" {
  count = aws_guardduty_organization_configuration.this[0].detector_id != null && var.enable_s3_protection ? 1 : 0

  detector_id = aws_guardduty_organization_configuration.this[0].detector_id
  name        = "S3_DATA_EVENTS"
  auto_enable = var.auto_enable_organization_members
}

##################################################
# Amazon RDS Protection
##################################################
resource "aws_guardduty_organization_configuration_feature" "rds_protection" {
  count = aws_guardduty_organization_configuration.this[0].detector_id != null && var.enable_rds_protection ? 1 : 0

  detector_id = aws_guardduty_organization_configuration.this[0].detector_id
  name        = "RDS_LOGIN_EVENTS"
  auto_enable = var.auto_enable_organization_members
}

##################################################
# Amazon Lambda Protection
##################################################
resource "aws_guardduty_organization_configuration_feature" "lambda_protection" {
  count = aws_guardduty_organization_configuration.this[0].detector_id != null && var.enable_lambda_protection ? 1 : 0

  detector_id = aws_guardduty_organization_configuration.this[0].detector_id
  name        = "LAMBDA_NETWORK_LOGS"
  auto_enable = var.auto_enable_organization_members
}

##################################################
# Amazon EKS Protection and Runtime Monitoring
##################################################
resource "aws_guardduty_organization_configuration_feature" "kubernetes_protection" {
  count = aws_guardduty_organization_configuration.this[0].detector_id != null && var.enable_kubernetes_protection ? 1 : 0

  detector_id = aws_guardduty_organization_configuration.this[0].detector_id
  name        = "EKS_AUDIT_LOGS"
  auto_enable = var.auto_enable_organization_members
}

resource "aws_guardduty_organization_configuration_feature" "eks_runtime_monitoring" {
  count = aws_guardduty_organization_configuration.this[0].detector_id != null && var.enable_eks_runtime_monitoring ? 1 : 0

  detector_id = aws_guardduty_organization_configuration.this[0].detector_id
  name        = "RUNTIME_MONITORING"
  auto_enable = var.auto_enable_organization_members

  additional_configuration {
    name        = "EKS_ADDON_MANAGEMENT"
    auto_enable = var.enable_eks_runtime_monitoring && var.manage_eks_addon ? var.auto_enable_organization_members : "NONE"
  }
}

##################################################
# Amazon ECS Runtime Monitoring
##################################################

resource "aws_guardduty_organization_configuration_feature" "ecs_runtime_monitoring" {
  count = aws_guardduty_organization_configuration.this[0].detector_id != null && var.enable_ecs_runtime_monitoring ? 1 : 0

  detector_id = aws_guardduty_organization_configuration.this[0].detector_id
  name        = "RUNTIME_MONITORING"
  auto_enable = var.auto_enable_organization_members

  additional_configuration {
    name        = "ECS_FARGATE_AGENT_MANAGEMENT"
    auto_enable = var.enable_ecs_runtime_monitoring && var.manage_ecs_agent ? var.auto_enable_organization_members : "NONE"
  }
}

##################################################
# Amazon EC2 Monitoring
##################################################

resource "aws_guardduty_organization_configuration_feature" "ec2_runtime_monitoring" {
  count = aws_guardduty_organization_configuration.this[0].detector_id != null && var.enable_ec2_runtime_monitoring ? 1 : 0

  detector_id = aws_guardduty_organization_configuration.this[0].detector_id
  name        = "RUNTIME_MONITORING"
  auto_enable = var.auto_enable_organization_members

  additional_configuration {
    name        = "EC2_AGENT_MANAGEMENT"
    auto_enable = var.enable_ec2_runtime_monitoring && var.manage_ec2_agent ? var.auto_enable_organization_members : "NONE"
  }
}

##################################################
# Amazon EBS Malware Protection
##################################################
resource "aws_guardduty_organization_configuration_feature" "ebs_protection" {
  count = aws_guardduty_organization_configuration.this[0].detector_id != null && var.enable_malware_protection ? 1 : 0

  detector_id = aws_guardduty_organization_configuration.this[0].detector_id
  name        = "EBS_MALWARE_PROTECTION"
  auto_enable = var.auto_enable_organization_members
}
