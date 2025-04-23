resource "random_id" "environment_name" {
  byte_length = 4
  prefix      = "${var.env}-"  # Prefix dynamically set from the environment variable
}


resource "random_id" "custom_environment_name" {
  byte_length = var.random_id_byte_length  # Use a variable for byte length for more flexibility
  prefix      = "${var.env}-"               # Prefix dynamically set from the environment variable
  suffix      = var.suffix                  # Optional suffix for more customization
}


