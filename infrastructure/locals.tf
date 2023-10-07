locals {
  motormate_prefix = "motormate"

  backend_prefix   = "backend"
  backend_location = "eastus"

  frontend_prefix   = "frontend"
  frontend_location = "westus"

  frontend_fqdn = azurerm_linux_web_app.web_app_frontend.default_hostname
}
