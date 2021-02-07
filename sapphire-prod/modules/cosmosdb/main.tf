resource "azurerm_cosmosdb_account" "cosmosdb" {
  name = "${var.azenv}-sap-cosdb-sql"
  location = var.location
  resource_group_name = var.resource_group_name
  offer_type = var.cosmosdboffertype
  kind = var.cosmosdbkind
  enable_automatic_failover = true
  consistency_policy {
    consistency_level = var.cosmosdbconsistency_level
  }
  geo_location {
    prefix = "cosmos-${var.azenv}"
    location = var.location
    failover_priority = 0
  }
  tags = {
    environment = "${var.azenv}"
  }
}

resource "azurerm_cosmosdb_sql_database" "dbs" {
  count = length(var.cosdb)-1
  name                = var.cosdb[count.index]
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmosdb.name
  autoscale_settings{
   max_throughput = 4000
 }
  depends_on = [azurerm_cosmosdb_account.cosmosdb]
}

resource "azurerm_cosmosdb_sql_database" "siteexporter" {
  name                = var.cosdb[2]
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.cosmosdb.name
  throughput = 2000
  depends_on = [azurerm_cosmosdb_account.cosmosdb]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire_dedicated" {
  count = length(var.sapphiredb_dedicated)
  name                  = var.sapphiredb_dedicated[count.index]
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire
  database_name         = var.cosdb[0]
  partition_key_path    = "/siteId"

  autoscale_settings{
   max_throughput = 4000
 }

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }
     
    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire_shared" {
  count = length(var.sapphiredb_shared)
  name                  = var.sapphiredb_shared[count.index]
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire
  database_name         = var.cosdb[0]

  partition_key_path    = "/siteId"

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire_pkey_id" {
  count = length(var.sapphiredb_pkey_id)
  name                  = var.sapphiredb_pkey_id[count.index]
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire
  database_name         = var.cosdb[0]
  partition_key_path    = "/id"

  autoscale_settings{
   max_throughput = 4000
 }
  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire_pkey_name" {
  count = length(var.sapphiredb_pkey_name)
  name                  = var.sapphiredb_pkey_name[count.index]
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire
  database_name         = var.cosdb[0]
  partition_key_path    = "/name"

  autoscale_settings{
   max_throughput = 4000
 }

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "siteexporter" {
  count = length(var.siteexporter)
  name                  = var.siteexporter[count.index]
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #SiteExporter
  database_name         = var.cosdb[2]
  partition_key_path    = "/id"

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire2_pkey_siteid_dedicated" {
  count = length(var.sapphire2_pkey_siteid_dedicated)
  name                  = var.sapphire2_pkey_siteid_dedicated[count.index]
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire2
  database_name         = var.cosdb[1]

  partition_key_path    = "/siteId"

  autoscale_settings{
   max_throughput = 4000
 }

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire2_pkey_siteid_shared" {
  name                  = "daily-task-result"
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire2
  database_name         = var.cosdb[1]

  partition_key_path    = "/siteId"

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire2_pkey_id_dedicated" {
  count = length(var.sapphire2_pkey_id_dedicated)
  name                  = var.sapphire2_pkey_id_dedicated[count.index]
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire2
  database_name         = var.cosdb[1]

  partition_key_path    = "/id"

  autoscale_settings{
   max_throughput = 4000
 }


  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire2_pkey_id_shared" {
  name                  = "feed-stylesheets"
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire2
  database_name         = var.cosdb[1]

  partition_key_path    = "/id"


  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire2_pkey_electronicFeedId_shared" {
  name                  = "external-site-mappings"
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire2
  database_name         = var.cosdb[1]

  partition_key_path    = "/electronicFeedId"

  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }
  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

resource "azurerm_cosmosdb_sql_container" "Sapphire2_pkey_workflowId_dedicated" {
  name                  = "aura-workflow-v2"
  resource_group_name   = var.resource_group_name
  account_name          = azurerm_cosmosdb_account.cosmosdb.name
  #Sapphire2
  database_name         = var.cosdb[1]

  partition_key_path    = "/workflowId"

  autoscale_settings{
   max_throughput = 4000
 }
  indexing_policy {
    indexing_mode = "Consistent"

    included_path {
      path = "/*"
    }

    excluded_path {
      path = "/\"_etag\"/?"
    }
  }

  depends_on = [azurerm_cosmosdb_sql_database.dbs]
}

