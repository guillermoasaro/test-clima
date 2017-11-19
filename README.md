# test-clima README

* Ruby version: `2.4.0`

* Rails version: `5.1.4`

* Configuration: `bundle`

* Database creation/initialization: `rails db:setup`

* Example Requests
  - Show all Areas: `http://localhost:3000/areas/`
  - Show Area #3: `http://localhost:3000/areas/3`
  - Add new Area to Area #2 : `http://localhost:3000/areas/2/add?area[name]=Compras&area[grade]=4.8`
  - Update Area #10 attributes: `http://localhost:3000/areas/10/update?area[name]=Ventas&area[grade]=9.9`