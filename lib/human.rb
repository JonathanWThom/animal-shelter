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
      phone = human.fetch("phone").to_i
      animal_preference = human.fetch("animal_preference")
      breed_preference = human.fetch("breed_preference")
      id = human.fetch("id").to_i
      humans.push(Human.new(:name => name, :phone => phone, :animal_preference => animal_preference, :breed_preference => breed_preference, :id => id))
    end
    humans
  end

  def self.breed(breed)
    returned_humans = DB.exec("SELECT * FROM humans WHERE breed_preference = '#{breed}';")
    humans = []
    returned_humans.each() do |human|
      name = human.fetch("name")
      phone = human.fetch("phone").to_i
      animal_preference = human.fetch("animal_preference")
      breed_preference = human.fetch("breed_preference")
      id = human.fetch("id").to_i
      humans.push(Human.new(:name => name, :phone => phone, :animal_preference => animal_preference, :breed_preference => breed_preference, :id => id))
    end
    humans
  end

  def save
    result = DB.exec("INSERT INTO humans (name, phone, animal_preference, breed_preference) VALUES ('#{@name}', #{@phone}, '#{@animal_preference}', '#{@breed_preference}') RETURNING id;")
    @id = result[0].fetch("id").to_i
  end

  def ==(another_human)
    self.name().==(another_human.name()).&self.phone().==(another_human.phone()).&(self.animal_preference().==(another_human.animal_preference())).&(self.breed_preference().==(another_human.breed_preference())).&(self.id().==(another_human.id()))
  end

  def self.find(id)
    found_human = nil
    Human.all.each() do |human|
      if human.id().==(id)
        found_human = human
      end
    end
    found_human
  end

  def pets
    returned_pets = DB.exec("SELECT * FROM animals WHERE human_id = #{@id};")
    pets = []
    returned_pets.each() do |pet|
      name = pet.fetch("name")
      gender = pet.fetch("gender")
      date_of_admittance = pet.fetch("date_of_admittance")
      type = pet.fetch("type")
      breed = pet.fetch("breed")
      human_id = pet.fetch("human_id").to_i()
      id = pet.fetch("id").to_i
      pets.push(Animal.new({:name => name, :gender => gender, :date_of_admittance => date_of_admittance, :type => type, :breed => breed, :human_id => human_id, :id => id}))
    end
    pets
  end
end
