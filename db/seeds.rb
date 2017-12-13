# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faculty.create(universidad:"UNLP",facultad:"Agronomía",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Arquitectura",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Bellas Artes",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Ciencias Exactas",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Ciencias Naturales",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Economía",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Humanidades",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Informática",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Ingeniería",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Medicína",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Odontología",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Periodismo",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Psicología",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Trabajo Social",provincia:"Buenos Aires",ciudad:"La Plata")
Faculty.create(universidad:"UNLP",facultad:"Veterinaria",provincia:"Buenos Aires",ciudad:"La Plata")

Tag.create(nombre:"Matemática A")
Tag.create(nombre:"Matemática B")
Tag.create(nombre:"Física")
Tag.create(nombre:"Lengua I")
Tag.create(nombre:"Lengua II")
Tag.create(nombre:"Lengua III")
Tag.create(nombre:"Ingeniería de Software")

Permission.create(nombre:"Crear pregunta o respuesta",puntos:1)
Permission.create(nombre:"Votar positivo en pregunta, respuesta o comentario",puntos:15)
Permission.create(nombre:"Comentar en cualquier lado",puntos:20)
Permission.create(nombre:"Votar negativo",puntos:100)
Permission.create(nombre:"Administrar etiquetas",puntos:300)
Permission.create(nombre:"Administrar facultades",puntos:500)
Permission.create(nombre:"Modificar contenidos",puntos:1000)
