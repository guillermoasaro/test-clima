# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Area.delete_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'areas'")
root = Area.create! name: "Gerencia General"
[
  ["Gerencia Finanzas", ["Contabilidad"]],
  ["Gerencia Operaciones", ["Análisis","Consultoría"]],
  ["Gerencia Tecnología", ["Desarrollo","QA"]],
].each do |area_name,sub_areas|
  child = root.children.create name: area_name
  sub_areas.each do |sub_area_name|
    child.children.create name: sub_area_name, grade: (1..10).step(0.1).to_a.sample.round(1)
  end
end
