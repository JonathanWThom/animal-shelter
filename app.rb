require('sinatra')
require('sinatra/reloader')
require('pry')
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

get('/alphabetically/:id') do
  @pets = Animal.alphabetize()
  @human = Human.find(params.fetch("id").to_i)
  erb(:pets)
end

post('/type') do
  type = params.fetch('type')
  @pets = Animal.type(type)
  @human = Human.find(params.fetch("human_id"))
  erb(:pets)
end

post('/breed') do
  breed = params.fetch("breed")
  @pets = Animal.breed(breed)
  @human = Human.find(params.fetch("human_id"))
  erb(:pets)
end

#this needs more i thinK?
get('/pets/:id') do
  @pet = Animal.find(params.fetch("id").to_i)
  erb(:pet)
end

patch('/adopt/:id') do
  human_id = params.fetch("id").to_i
  @human = Human.find(human_id)
  pet_id = params.fetch("pet_id").to_i
  @pet = Animal.find(pet_id)
  @pet.update({:human_id => human_id})
  erb(:customer_personal)
end
