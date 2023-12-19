locals {
  motormate_prefix = "motormate"

  backend_prefix   = "backend"
  backend_location = "eastus"

  frontend_prefix   = "frontend"
  frontend_location = "westus"

  frontend_client_hostname = "${local.motormate_prefix}-${local.frontend_prefix}-web-client"
  frontend_admin_hostname  = "${local.motormate_prefix}-${local.frontend_prefix}-web-admin"
  backend_hostname         = "${local.motormate_prefix}-${local.backend_prefix}-web-api"

  frontend_client_fqdn = "${local.frontend_client_hostname}.azurewebsites.net"
  frontend_admin_fqdn  = "${local.frontend_admin_hostname}.azurewebsites.net"
  backend_fqdn         = "${local.backend_hostname}.azurewebsites.net"

  google_client_id = "248508653252-6vk23s9roilcu60b7c8053i6qmqikk9q.apps.googleusercontent.com"

  cloudinary_name          = "dmwvl1lok"
  cloudinary_upload_preset = "m9fflfsz"
  cloudinary_api_key       = "284337174877642"
  cloudinary_api_secret    = "HvV6ojE_YOcdbmTdKBP_KBt3Pu4"

  stripe_publishable_key = "pk_test_51OAaznETkkliUm4yYTUO6ouPkT5ySCKpaoisrKDS0bR2AIU9xJcJfSUohs9xIPkToAXdSn7luIYcg1UXGmmF53Oh00o4axoOdf"
  stripe_secret_key      = "sk_test_51OAaznETkkliUm4ybykeUgwE26S0oPPbbR57T9cWBa52rh6T1bWXBwRHBt25IAlThFIuGtDlOT9yFSCvFGN4iHXw00L4RIhtrM"
}
