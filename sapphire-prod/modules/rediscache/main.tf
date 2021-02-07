resource "azurerm_redis_cache" "main" {
  count               = length(var.redisacc)
  name                = "${var.azenv}-${var.redisacc[count.index]}"
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = var.rediscapacity
  family              = var.redisfamily
  sku_name            = var.redissku
  minimum_tls_version = null

  redis_configuration {
    maxmemory_delta                 = 50
    maxmemory_reserved              = 50
    maxfragmentationmemory_reserved = 50
  }
}
