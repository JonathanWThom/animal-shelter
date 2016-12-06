require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/animal')
require('./lib/human')
require('pg')

## REMEMBER TO CHANGE THIS
DB = PG.connect({:dbname => "shelter_test"})

get('/') do
  erb(:index)
end

get('/customer') do
  erb(:new_customer_form)
end

get('/worker') do
  erb(:worker)
end

post('/customer/new') do
  name = params.fetch("name")
  phone = params.fetch("phone").to_i
  animal_preference = params.fetch("animal_preference")
  breed_preference = params.fetch("breed_preference")
  @human = Human.new({:name => name, :phone => phone, :animal_preference => animal_preference, :breed_preference => breed_preference, :id => nil})
  @human.save()
  @pets = Animal.all()
  erb(:pets)
end
