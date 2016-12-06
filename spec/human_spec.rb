require('spec_helper')



describe(Human) do
  before() do
    @human = Human.new(:name => "Jonathan", :phone => 5555555, :animal_preference => "Dog", :breed_preference => "Dachshund", :id => nil)
  end
  describe(".all") do
    it("returns an empty array at first") do
      expect(Human.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("returns the name") do
      expect(@human.name()).to(eq("Jonathan"))
    end
  end

  describe("#phone") do
    it("returns the phone") do
      expect(@human.phone()).to(eq(5555555))
    end
  end

  describe("#animal_preference") do
    it("returns the animal_preference") do
      expect(@human.animal_preference()).to(eq("Dog"))
    end
  end

  describe("#breed_preference") do
    it("returns the breed_preference") do
      expect(@human.breed_preference()).to(eq("Dachshund"))
    end
  end

  describe("#save") do
    it("saves an object to the database") do
      @human.save()
      expect(Human.all).to(eq([@human]))
    end
  end

  describe("#id") do
    it("returns the id") do
      @human.save()
      expect(@human.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".breed") do
    it("returns humans by breed preference") do
      @human.save()
      human1 = Human.new(:name => "Tyler", :phone => 5555555, :animal_preference => "Dog", :breed_preference => "Dachshund", :id => nil)
      human1.save()
      human2 = Human.new(:name => "Pug Lover", :phone => 5555555, :animal_preference => "Dog", :breed_preference => "Pug", :id => nil)
      human2.save
      expect(Human.breed("Dachshund")).to(eq([@human, human1]))
    end
  end
end
