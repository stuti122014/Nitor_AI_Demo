output "id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

output "frontend_workload_subnet_id" {
  value       = var.frontend_subnet_id
  description = "Auto-selected VNet frontend subnet for frontend workload ingress"
}

output "backend_workload_subnet_id" {
  value       = var.subnet_id
  description = "Auto-selected VNet backend subnet for backend compute services"
}
