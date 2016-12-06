require('spec_helper')

describe(Animal) do
  before() do
    @animal = Animal.new({:name => "Ernie", :gender => "Male", :date_of_admittance => "2013-05-07", :type => "Dog", :breed => "Dachshund", :human_id => 1})
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
      expect(@animal.date_of_admittance()).to(eq("2013-05-07"))
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
end
