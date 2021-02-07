resource "azurerm_app_service_plan" "main" {
  name                = "ASP-${var.resource_group_name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true
  sku {
    tier     = var.appserviceplan_tier
    size     = var.appserviceplan_size
    capacity = var.appserviceplan_capacity
  }
}


resource "azurerm_app_service" "main" {
  name                = "${var.azenv}-sap-appsvc-ui"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.main.id

  #app_settings = {
  #  "SOME_KEY" = "some-value"
  #}
  client_affinity_enabled = "false"
  enabled                 = "true"
  https_only              = true

  site_config {
    always_on = "true"

    cors {
      allowed_origins = var.allowed_origins
    }
    default_documents         = ["Default.htm", "Default.html", "Default.asp", "index.htm", "index.html", "iisstart.htm", "default.aspx", "index.php", "hostingstart.html"]
    dotnet_framework_version  = "v4.0"
    ftps_state                = "AllAllowed"
    local_mysql_enabled       = "false"
    linux_fx_version          = "node|8.1"
    managed_pipeline_mode     = "Integrated"
    min_tls_version           = "1.2"
    scm_type                  = "VSTSRM"
    use_32_bit_worker_process = "true"
    websockets_enabled        = "false"
  }
}

