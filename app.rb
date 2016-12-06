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
