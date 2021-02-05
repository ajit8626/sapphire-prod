output "evth1ns" {
  value = "${var.azenv}-${var.eventhubns[0]}"
}
output "evth2ns" {
  value = "${var.azenv}-${var.eventhubns[1]}"
}
output "eh_primarykey" {
  value = "RootManageSharedAccessKey"
}
output "eh_listenaccesskey" {
	value = "ListenAccessKey"
}
output "eh_duplexpolicykey" {
	value = "DuplexPolicy"
}
