class Animal

  attr_reader(:id, :name, :gender, :date_of_admittance, :type, :breed, :human_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @date_of_admittance = attributes.fetch(:date_of_admittance)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @human_id = attributes.fetch(:human_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      date_of_admittance = animal.fetch("date_of_admittance")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      human_id = animal.fetch("human_id").to_i()
      id = animal.fetch("id").to_i
      animals.push(Animal.new({:name => name, :gender => gender, :date_of_admittance => date_of_admittance , :type => type, :breed => breed, :human_id => human_id, :id => id }))
    end
    animals
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO animals (name, gender, date_of_admittance, type, breed) VALUES ('#{@name}', '#{@gender}', '#{@date_of_admittance}', '#{@type}', '#{@breed}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  define_method(:==) do |another_animal|
    self.name().==(another_animal.name()).&(self.gender().==(another_animal.gender())).&(self.type().==(another_animal.type())).&(self.breed().==(another_animal.breed())).&(self.human_id().==(another_animal.human_id()))
  end

  define_singleton_method(:alphabetize) do
    returned_animals = DB.exec("SELECT * FROM animals ORDER BY name ASC;")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      date_of_admittance = animal.fetch("date_of_admittance")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      human_id = animal.fetch("human_id").to_i()
      id = animal.fetch("id").to_i
      animals.push(Animal.new({:name => name, :gender => gender, :date_of_admittance => date_of_admittance , :type => type, :breed => breed, :human_id => human_id, :id => id }))
    end
    animals
  end

  define_singleton_method(:breed) do |breed_type|
    returned_animals = DB.exec("SELECT * FROM animals WHERE breed = '#{breed_type}';")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      date_of_admittance = animal.fetch("date_of_admittance")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      human_id = animal.fetch("human_id").to_i()
      id = animal.fetch("id").to_i
      animals.push(Animal.new({:name => name, :gender => gender, :date_of_admittance => date_of_admittance , :type => type, :breed => breed, :human_id => human_id, :id => id }))
    end
    animals
  end

  define_singleton_method(:type) do |type|
    returned_animals = DB.exec("SELECT * FROM animals WHERE type = '#{type}';")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      date_of_admittance = animal.fetch("date_of_admittance")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      human_id = animal.fetch("human_id").to_i()
      id = animal.fetch("id").to_i
      animals.push(Animal.new({:name => name, :gender => gender, :date_of_admittance => date_of_admittance , :type => type, :breed => breed, :human_id => human_id, :id => id }))
    end
    animals
  end

  define_singleton_method(:chronologically) do
    returned_animals = DB.exec("SELECT * FROM animals ORDER BY date_of_admittance ASC;")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch("name")
      gender = animal.fetch("gender")
      date_of_admittance = animal.fetch("date_of_admittance")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      human_id = animal.fetch("human_id").to_i()
      id = animal.fetch("id").to_i()
      animals.push(Animal.new({:name => name, :gender => gender, :date_of_admittance => date_of_admittance , :type => type, :breed => breed, :human_id => human_id, :id => id}))
    end
    animals
  end

  define_singleton_method(:find) do |id|
    Animal.all().each do |animal|
      if animal.id() == id
          return animal
      end
    end
  end

  define_method(:update) do |attributes|
    @name = self.name()
    @gender = self.gender()
    @date_of_admittance = self.date_of_admittance()
    @type = self.type()
    @breed = self.breed()
    @id = self.id()
    @human_id = attributes.fetch(:human_id)
    DB.exec("UPDATE animals SET human_id = #{@human_id} WHERE id = #{@id};")
  end
end
