output "generated_pet_name" {
  description = "The generated pet name written to hello.txt."
  value       = random_pet.name.id
}

output "generated_pet_names" {
  description = "The randomly selected number of generated pet names."
  value = [
    for index, pet in random_pet.multiple_names : pet.id
    if index < random_integer.random_integer_10.result
  ]
}

output "generated_pet_count" {
  description = "The random number that determines how many pet names are generated."
  value       = random_integer.random_integer_10.result
}

output "generated_number" {
  description = "The generated number written to hello.txt."
  value       = random_integer.number.result
}

output "hello_message" {
  description = "The complete greeting written to hello.txt."
  value       = local_file.example.content
}
