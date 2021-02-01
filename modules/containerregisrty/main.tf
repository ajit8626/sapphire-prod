resource "azurerm_container_registry" "acr" {
  name                = "dxwetstockprod"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.containerregistry_sku
  admin_enabled       = true
}

resource "azurerm_container_group" "aci" {
  name                = "prd-sap-sftp"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "public"
  dns_name_label      = "prd-sap-sftp"
  os_type             = "Linux"

  container {
    name   = "prd-sap-sftp"
    image  = "sapphire.azurecr.io/sftp-server:1.0.17"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 22
      protocol = "TCP"
    }
  }
  depends_on = [azurerm_container_registry.acr]
}
