class Human
  attr_reader(:name, :phone, :animal_preference, :breed_preference, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @animal_preference = attributes.fetch(:animal_preference)
    @breed_preference = attributes.fetch(:breed_preference)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_humans = DB.exec("SELECT * FROM humans;")
    humans = []
    returned_humans.each() do |human|
      name = human.fetch("name")
      phone = human.fetch("phone")
      animal_preference = human.fetch("animal_preference")
      breed_preference = human.fetch("breed_preference")
      id = human.fetch("id").to_i
      humans.push(Human.new(:name => name, :phone => phone, :animal_preference => animal_preference, :breed_preference => breed_preference, :id => id))
    end
    humans
  end
end
