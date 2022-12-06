variable "user-name" {
    type = string
}


output "print-name" {
    value = "Hello, ${var.user-name}"
}