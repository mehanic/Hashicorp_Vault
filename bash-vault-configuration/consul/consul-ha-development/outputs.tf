output "consul_template" {
  value = data.template_file.consul_config[*].rendered
}
