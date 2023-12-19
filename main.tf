# || Motormate Infrastructure - Frontend || #
module "web_app_essentials_frontend" {
  source = "./applications/web-app-essentials"

  app_type = local.frontend_prefix
  location = local.frontend_location
}

resource "azurerm_linux_web_app" "web_app_frontend_client" {
  name                = local.frontend_client_hostname
  resource_group_name = module.web_app_essentials_frontend.rg_name
  location            = local.frontend_location
  service_plan_id     = module.web_app_essentials_frontend.service_plan_id

  site_config {
    always_on = false
    cors {
      support_credentials = true
    }
    application_stack {
      node_version = "18-lts"
    }
    use_32_bit_worker  = true
    websockets_enabled = true
  }

  app_settings = {
    "REACT_APP_MOTORMATE_BASE_URL"      = "https://${local.frontend_client_fqdn}",
    "REACT_APP_MOTORMATE_API_URL"       = "https://${local.backend_fqdn}/",
    "REACT_APP_GOOGLE_CLIENT_ID"        = local.google_client_id,
    "REACT_APP_CLOUDINARY_NAME"         = local.cloudinary_name,
    "REACT_APP_CLOUDINARY_UPLOADPRESET" = local.cloudinary_upload_preset,
    "REACT_APP_CLOUDINARY_API_KEY"      = local.cloudinary_api_key,
    "REACT_APP_CLOUDINARY_API_SECRET"   = local.cloudinary_api_secret,
    "REACT_APP_STRIPE_PUBLISHABLE_KEY"  = local.stripe_publishable_key,
    "REACT_APP_STRIPE_SECRET_KEY"       = local.stripe_secret_key
  }

  depends_on = [module.web_app_essentials_frontend]
}

resource "azurerm_linux_web_app" "web_app_frontend_admin" {
  name                = local.frontend_admin_hostname
  resource_group_name = module.web_app_essentials_frontend.rg_name
  location            = local.frontend_location
  service_plan_id     = module.web_app_essentials_frontend.service_plan_id

  site_config {
    always_on = false
    cors {
      support_credentials = true
    }
    application_stack {
      node_version = "18-lts"
    }
    use_32_bit_worker  = true
    websockets_enabled = true
  }

  app_settings = {
    "REACT_APP_MOTORMATE_CLIENT_BASE_URL" = "https://${local.frontend_client_fqdn}",
    "REACT_APP_MOTORMATE_ADMIN_BASE_URL"  = "https://${local.frontend_admin_fqdn}",
    "REACT_APP_MOTORMATE_API_URL"         = "https://${local.backend_fqdn}",
    "REACT_APP_GOOGLE_CLIENT_ID"          = local.google_client_id,
    "REACT_APP_CLOUDINARY_NAME"           = local.cloudinary_name,
    "REACT_APP_CLOUDINARY_UPLOADPRESET"   = local.cloudinary_upload_preset,
    "REACT_APP_CLOUDINARY_API_KEY"        = local.cloudinary_api_key,
    "REACT_APP_CLOUDINARY_API_SECRET"     = local.cloudinary_api_secret
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
  name                = "${local.motormate_prefix}-${local.backend_prefix}-web-api"
  resource_group_name = module.web_app_essentials_backend.rg_name
  location            = local.backend_location
  service_plan_id     = module.web_app_essentials_backend.service_plan_id

  site_config {
    always_on = false
    cors {
      allowed_origins = [
        "http://localhost:3000",
        "https://${local.frontend_client_fqdn}",
        "https://${local.frontend_admin_fqdn}",
        "http://${local.frontend_client_fqdn}",
        "http://${local.frontend_admin_fqdn}"
      ]
      support_credentials = true
    }
    application_stack {
      dotnet_version = "6.0"
    }
    use_32_bit_worker  = true
    websockets_enabled = true
  }

  depends_on = [module.web_app_essentials_backend]
}


