module "LateDataProcessor" {
  source              = "./LateDataProcessor"
  azenv               = var.azenv
  resource_group_name = var.resource_group_name
  location            = var.location
  eh_primarykey       = var.eh_primarykey
  sb_primarykey       = var.sb_primarykey
}

module "MissingSales" {
  source                     = "./MissingSales"
  azenv                      = var.azenv
  resource_group_name        = var.resource_group_name
  location                   = var.location
  eh_listenaccesskey         = var.eh_listenaccesskey
  stgacccontainername        = var.stgacccontainername
  stgaccnamestraminput       = var.stgaccnamestraminput
  stgaccnamestraminputacckey = var.stgaccnamestraminputacckey
  sb_primarykey              = var.sb_primarykey
  eh_primarykey              = var.eh_primarykey
}

module "MissingStock" {
  source                     = "./MissingStock"
  azenv                      = var.azenv
  resource_group_name        = var.resource_group_name
  location                   = var.location
  eh_listenaccesskey         = var.eh_listenaccesskey
  stgaccnamestraminput       = var.stgaccnamestraminput
  stgaccnamestraminputacckey = var.stgaccnamestraminputacckey
  stgacccontainername        = var.stgacccontainername
  sb_primarykey              = var.sb_primarykey
  eh_primarykey              = var.eh_primarykey
}

module "Sales-Stock-Buffer" {
  source              = "./Sales-Stock-Buffer"
  azenv               = var.azenv
  resource_group_name = var.resource_group_name
  location            = var.location
  eh_duplexpolicykey  = var.eh_duplexpolicykey
}

