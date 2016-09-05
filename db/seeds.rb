# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Statusorder.create(value: "CREADA", pending: true)
Statusorder.create(value: "ESPERANDO PAGO", pending: true)
Statusorder.create(value: "PAGADA", pending: true)
Statusorder.create(value: "PREPARANDO ENVIO", pending: true)
Statusorder.create(value: "EN DESPACHO", pending: true)
Statusorder.create(value: "ENTREGADA", pending: true)

Profile.create(name: "ADMINISTRADOR",canadmin: true, cansell: true, canadminstore: true, canbuy: true)
Profile.create(name: "USUARIO",canadmin: false, cansell: false, canadminstore: false, canbuy: true)
Profile.create(name: "VENDEDOR",canadmin: false, cansell: true, canadminstore: true, canbuy: true)

Contactype.create(name: "CORREO")


Paymentmethod.create(name: "TRANSFERENCIA", description: "TRANSFERIR A CUENTA BANCARIA")
Paymentmethod.create(name: "WEBPAY", description: "PAGO EN LINEA")
