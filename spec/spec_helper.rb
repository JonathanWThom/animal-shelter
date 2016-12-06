require('rspec')
require('animal')
require('person')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM animals *;')
    DB.exec('DELETE FROM humans *;')
  end
end
