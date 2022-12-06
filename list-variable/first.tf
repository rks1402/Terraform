output "print-first" {
    value = "${join(",",var.users)}"
}

output "hello-world-upper" {
    value = "${upper(var.users[0])}"
}

output "hello-world-lower" {
    value = "${lower(var.users[1])}"
}

output "hello-world-title" {
    value = "${title(var.users[2])}"
}