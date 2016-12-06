class Animal

  attr_reader(:name, :gender, :date_of_admittance, :type, :breed, :human_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @gender = attributes.fetch(:gender)
    @date_of_admittance = attributes.fetch(:date_of_admittance)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @human_id = attributes.fetch(:human_id)
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
      animals.push(Animal.new({:name => name, :gender => gender, :date_of_admittance => date_of_admittance , :type => type, :breed => breed, :human_id => human_id }))
    end
    animals
  end

  define_method(:save) do
    DB.exec("INSERT INTO animals (name, gender, date_of_admittance, type, breed, human_id) VALUES ('#{@name}', '#{@gender}', '#{@date_of_admittance}', '#{@type}', '#{@breed}', #{@human_id});")
  end

  define_method(:==) do |another_animal|
    self.name().==(another_animal.name()).&(self.gender().==(another_animal.gender())).&(self.type().==(another_animal.type())).&(self.breed().==(another_animal.breed())).&(self.human_id().==(another_animal.human_id()))
  end
end
