require('spec_helper')

describe(Animal) do
  before() do
    @animal = Animal.new({:name => "Ernie", :gender => "Male", :date_of_admittance => "2013-05-07 00:00:00", :type => "Dog", :breed => "Dachshund", :human_id => 1, :id => nil})
  end

  describe(".all") do
    it('Will be empty at first') do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe("#name") do
    it('will return the name') do
      expect(@animal.name()).to(eq("Ernie"))
    end
  end

  describe("#gender") do
    it('will return the gender') do
      expect(@animal.gender()).to(eq("Male"))
    end
  end

  describe("#date_of_admittance") do
    it('will return the date of admittance') do
      expect(@animal.date_of_admittance()).to(eq("2013-05-07 00:00:00"))
    end
  end

  describe("#type") do
    it('will return the type') do
      expect(@animal.type()).to(eq("Dog"))
    end
  end

  describe("#breed") do
    it('will return the breed') do
      expect(@animal.breed()).to(eq("Dachshund"))
    end
  end

  describe("#human_id") do
    it('will return the human id') do
      expect(@animal.human_id()).to(eq(1))
    end
  end

  describe('#save') do
    it('adds an animal to the animal array') do
      @animal.save()
      expect(Animal.all()).to(eq([@animal]))
    end
  end

  describe("#==") do
    it('it is the same if it has the same attributes except date and human') do
      new_animal = Animal.new({:name => "Ernie", :gender => "Male", :date_of_admittance => "2013-05-07", :type => "Dog", :breed => "Dachshund", :human_id => 1, :id => nil})
      expect(new_animal).to(eq(@animal))
    end
  end

  describe(".alphabetize") do
    it('will return all animals in alphabetical order by name') do
      @animal.save()
      new_animal = Animal.new({:name => "Arnie", :gender => "Male", :date_of_admittance => "2013-05-07", :type => "Dog", :breed => "Dachshund", :human_id => 1, :id => nil})
      new_animal.save()
      expect(Animal.alphabetize()).to(eq([new_animal, @animal]))
    end
  end

  describe(".breed") do
    it('returns all animals of a certain breed') do
      @animal.save()
      new_animal = Animal.new({:name => "Arnie", :gender => "Male", :date_of_admittance => "2013-05-07", :type => "Dog", :breed => "Pug", :human_id => 1, :id => nil})
      new_animal.save()
      expect(Animal.breed("Pug")).to(eq([new_animal]))
    end
  end

  describe(".type") do
    it('returns all animals of a certain type') do
      @animal.save()
      new_animal = Animal.new({:name => "Arnie", :gender => "Male", :date_of_admittance => "2013-05-07", :type => "Dog", :breed => "Pug", :human_id => 1, :id => nil})
      new_animal.save()
      new_animal2 = Animal.new({:name => "Arnie", :gender => "Male", :date_of_admittance => "2013-05-07", :type => "Cat", :breed => "Pug", :human_id => 1, :id => nil})
      new_animal2.save()
      expect(Animal.type("Cat")).to(eq([new_animal2]))
    end
  end

  describe('.chronologically') do
    it('returns all animals by longest term to shortest') do
      @animal.save()
      new_animal = Animal.new({:name => "Arnie", :gender => "Male", :date_of_admittance => "2011-05-07", :type => "Dog", :breed => "Pug", :human_id => 1, :id => nil})
      new_animal.save()
      new_animal2 = Animal.new({:name => "Arnie", :gender => "Male", :date_of_admittance => "2009-05-07", :type => "Cat", :breed => "Pug", :human_id => 1, :id => nil})
      new_animal2.save()
      expect(Animal.chronologically()).to(eq([new_animal2, new_animal, @animal]))
    end
  end

  describe(".find") do
    it("finds an animal by their id number") do
      new_animal = Animal.new({:name => "Arnie", :gender => "Male", :date_of_admittance => "2011-05-07 00:00:00", :type => "Dog", :breed => "Pug", :human_id => 1, :id => nil})
      new_animal.save()
      puts new_animal
      expect(Animal.find(new_animal.id())).to(eq(new_animal))
    end
  end

  describe('#update') do
    it('updates an animals human id') do
      new_animal = Animal.new({:name => "Arnie", :gender => "Male", :date_of_admittance => "2011-05-07 00:00:00", :type => "Dog", :breed => "Pug", :human_id => 1, :id => nil})
      new_animal.save()
      new_animal.update({:human_id => 2})
      expect(new_animal.human_id()).to(eq(2))
    end
  end
end
