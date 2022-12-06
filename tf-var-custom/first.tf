variable "age" {
    type = number
}

variable "user-name" {
    type = string
}


output "print-name" {
    value = "Hello, ${var.user-name}, your age is ${var.age}"
}