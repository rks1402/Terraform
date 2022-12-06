output "user-age" {
    value = "my name is ${var.user-name} and my age is ${lookup(var.users-age,"${var.user-name}")}"
}