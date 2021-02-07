resource "azurerm_key_vault" "main" {
  name                            = "${var.azenv}-sap-kv5"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku_name                        = var.keyvaultsku
  tenant_id                       = var.azure_tenant_id
  soft_delete_enabled             = "true"
  enabled_for_template_deployment = "true"
}

