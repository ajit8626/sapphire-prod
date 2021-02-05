resource "azurerm_iothub" "main" {
  name = "${var.azenv}-sap-ioth"
  resource_group_name = var.resource_group_name
  location = var.location
  sku {
    name = var.iothsku
    capacity = var.iothcapacity
  }
  event_hub_partition_count = 2
  event_hub_retention_in_days = 1
}

#Shared access policy
resource "azurerm_iothub_shared_access_policy" "iothubowner" {
  name                = "iothubowner"
  resource_group_name =  var.resource_group_name
  iothub_name         = azurerm_iothub.main.name

  registry_read = true
  registry_write = true
  service_connect = true
  device_connect = true
}

resource "azurerm_iothub_shared_access_policy" "service" {
  name                = "service"
  resource_group_name =  var.resource_group_name
  iothub_name         = azurerm_iothub.main.name

  service_connect = true
}

resource "azurerm_iothub_shared_access_policy" "device" {
  name                = "device"
  resource_group_name =  var.resource_group_name
  iothub_name         = azurerm_iothub.main.name

  device_connect = true
}

resource "azurerm_iothub_shared_access_policy" "registryRead" {
  name                = "registryRead"
  resource_group_name =  var.resource_group_name
  iothub_name         = azurerm_iothub.main.name

  registry_read = true
}

resource "azurerm_iothub_shared_access_policy" "registryReadWrite" {
  name                = "registryReadWrite"
  resource_group_name =  var.resource_group_name
  iothub_name         = azurerm_iothub.main.name

  registry_write = true
  registry_read = true
}

resource "azurerm_template_deployment" "main" {
  name = "iothub-deployment"
  resource_group_name = var.resource_group_name
  parameters = {
    resourceGrp = var.resource_group_name
    subscriptd = var.azure_subscription_id
    iotHubName = azurerm_iothub.main.name
    eventHubNameSpace = var.evth1ns
    eventHubName = "tankinventories"
    eventSubscriptionName = "tankinventories"
    filterMessageType = "atg-tank-inventory"
  }
  template_body = <<DEPLOY
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "subscriptd": {
      "type": "string",
      "metadata": {
        "description": "subscriptd"
      }
    },
    "resourceGrp": {
      "type": "string",
      "minLength": 3,
      "metadata": {
        "description": "resourceGrp"
      }
    },
    "iotHubName": {
      "type": "string",
      "metadata": {
        "description": "iotHubName"
      }
    },
    "eventHubNameSpace": {
      "type": "string",
      "minLength": 3,
      "metadata": {
        "description": "eventHubNameSpace"
      }
    },
    "eventHubName": {
      "type": "string",
      "minLength": 3,
      "metadata": {
        "description": "eventHubName"
      }
    },
    "eventSubscriptionName": {
      "type": "string",
      "minLength": 3,
      "metadata": {
        "description": "eventSubscriptionName"
      }
    },
    "filterMessageType": {
      "type": "string",
      "minLength": 3,
      "metadata": {
        "description": "filterMessageType"
      }
    }
  },
  "resources": [
    {
      "type": "Microsoft.Devices/IotHubs/providers/eventSubscriptions",
      "name": "[concat(parameters('iotHubName'),'/Microsoft.EventGrid/',parameters('eventSubscriptionName'))]",
      "apiVersion": "2018-01-01",
      "properties": {
        "topic": "[concat('/subscriptions/',parameters('subscriptd'),'/resourcegroups/',parameters('resourceGrp'),'/providers/Microsoft.Devices/IotHubs/',parameters('iotHubName'))]",
        "destination": {
          "endpointType": "EventHub",
          "properties": {
            "resourceId": "[concat('/subscriptions/',parameters('subscriptd'),'/resourcegroups/',parameters('resourceGrp'),'/providers/Microsoft.EventHub/namespaces/',parameters('eventHubNameSpace'),'/eventhubs/',parameters('eventHubName'))]"
          }
        },
        "filter": {
          "subjectBeginsWith": "",
          "subjectEndsWith": "",
          "isSubjectCaseSensitive": false,
          "includedEventTypes": [
            "Microsoft.Devices.DeviceTelemetry"
          ],
          "advancedFilters": [
            {
              "operatorType": "StringIn",
              "key": "data.properties.message-type",
              "values": [
                "[parameters('filterMessageType')]"
              ]
            }           
          ]
        },
        "labels": [],
        "eventDeliverySchema": "EventGridSchema",
        "dependsOn": [
          "[resourceId('Microsoft.Devices/IotHubs', parameters('iotHubName'))]"
        ]
      }
    }
  ]
}
DEPLOY
 deployment_mode = "Incremental"
}
