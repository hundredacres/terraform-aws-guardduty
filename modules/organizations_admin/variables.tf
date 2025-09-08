##################################################
# GuardDuty Organizations Delegated Admin
##################################################
variable "guardduty_detector_id" {
  description = "The detector ID of the GuardDuty account."
  type        = string
}

variable "enable_s3_protection" {
  description = "Configure and enable S3 protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_rds_protection" {
  description = "Configure and enable RDS protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_lambda_protection" {
  description = "Configure and enable Lambda protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_kubernetes_protection" {
  description = "Configure and enable Kubernetes audit logs as a data source for Kubernetes protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_eks_runtime_monitoring" {
  description = "Enable Amazon EKS Runtime monitoring for all clusters. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_ecs_runtime_monitoring" {
  description = "Enable Amazon ECS Fargate Runtime monitoring for all clusters. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_ec2_runtime_monitoring" {
  description = "Enable Amazon EC2 Agent Management and Runtime monitoring. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_malware_protection" {
  description = "Configure and enable Malware Protection as data source for EC2 instances with findings for the detector. Defaults to `true`."
  type        = bool
  default     = true
}

variable "manage_eks_addon" {
  description = "Enable the management of Amazon GuardDuty Agent EKS Addon through GuardDuty. Defaults to `false`."
  type        = bool
  default     = false
}

variable "manage_ecs_agent" {
  description = "Enable the management of Amazon GuardDuty Agent for ECS through GuardDuty. Defaults to `false`."
  type        = bool
  default     = false
}

variable "manage_ec2_agent" {
  description = "Enable the management of Amazon GuardDuty Agent for EC2 through GuardDuty. Defaults to `false`."
  type        = bool
  default     = false
}

variable "admin_account_id" {
  description = "AWS Organizations Admin Account Id. Defaults to `null`"
  type        = string
  default     = null
}

variable "auto_enable_org_config" {
  description = "When this setting is enabled, all new accounts that are created in, or added to, the organization are added as a member accounts of the organization’s GuardDuty delegated administrator and GuardDuty is enabled in that AWS Region."
  type        = bool
  default     = null
}

variable "auto_enable_organization_members" {
  description = "Indicates the auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values are `ALL`, `NEW`, `NONE`. Defaults to `NEW`."
  type        = string
  default     = "NEW"
}
