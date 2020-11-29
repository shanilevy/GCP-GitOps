output "network" {
  value = module.vpc.network_name
}

output "subnet" {
  #value = element(module.vpc.subnets_names, 0)
  value = length(module.vpc.subnets_names) != ""  ?  element(module.vpc.subnets_names, 0) : " "

  #{for value in module.vpc.subnets_names : value => element(module.vpc.subnets_names, 0)}
  #value = module.vpc.subnets_names
}  
