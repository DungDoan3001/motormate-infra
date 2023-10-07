module "resource_group" {
  source = "../../shared/resource-group"

  rg_name  = "motormate-${var.app_type}-rg"
  location = var.location
}

module "service_plan" {
  source = "../../shared/service-plan"

  service_plan_name = "motormate-${var.app_type}-svp"
  location          = var.location
  rg_name           = module.resource_group.name

  depends_on = [module.resource_group]
}


