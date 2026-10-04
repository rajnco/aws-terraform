output "generated_pet_name" {
  description = "The generated pet name written to hello.txt."
  value       = random_pet.name.id
}

output "generated_number" {
  description = "The generated number written to hello.txt."
  value       = random_integer.number.result
}

output "hello_message" {
  description = "The complete greeting written to hello.txt."
  value       = local_file.example.content
}
