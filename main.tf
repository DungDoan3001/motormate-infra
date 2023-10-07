# || Motormate Infrastructure - Frontend || #
module "web_app_essentials_frontend" {
  source = "./applications/web-app-essentials"

  app_type = local.frontend_prefix
  location = local.frontend_location
}

resource "azurerm_linux_web_app" "web_app_frontend" {
  name                = "${local.motormate_prefix}-${local.frontend_prefix}-web-app"
  resource_group_name = module.web_app_essentials_frontend.rg_name
  location            = local.frontend_location
  service_plan_id     = module.web_app_essentials_frontend.service_plan_id

  site_config {
    always_on = false
    cors {
      support_credentials = true
    }
    application_stack {
      node_version = "16-lts"
    }
    use_32_bit_worker  = true
    websockets_enabled = true
  }

  depends_on = [module.web_app_essentials_frontend]
}


# || Motormate Infrastructure - Backend || #
module "web_app_essentials_backend" {
  source = "./applications/web-app-essentials"

  app_type = local.backend_prefix
  location = local.backend_location
}

resource "azurerm_linux_web_app" "web_app_backend" {
  name                = "${local.motormate_prefix}-${local.backend_prefix}-web-app"
  resource_group_name = module.web_app_essentials_backend.rg_name
  location            = local.backend_location
  service_plan_id     = module.web_app_essentials_backend.service_plan_id

  site_config {
    always_on = false
    cors {
      allowed_origins     = ["http://localhost:3000", "https://${local.frontend_fqdn}"]
      support_credentials = true
    }
    application_stack {
      dotnet_version = "6.0"
    }
    use_32_bit_worker  = true
    websockets_enabled = true
  }

  depends_on = [module.web_app_essentials_backend, azurerm_linux_web_app.web_app_frontend]
}


