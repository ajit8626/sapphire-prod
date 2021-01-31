resource "azurerm_signalr_service" "main" {
  name                = "${var.azenv}-sap-signalr"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = var.signalrsku
    capacity = var.signalrcapacity
  }

  features {
    flag  = "ServiceMode"
    value = var.signalr_servicemode
  }

  features {
    flag  = "EnableConnectivityLogs"
    value = "False"
  }

  features {
    flag  = "EnableMessagingLogs"
    value = "False"
  }

}
