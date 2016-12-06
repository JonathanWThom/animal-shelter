require('spec_helper')

describe(Human) do
  describe(".all") do
    it("returns an empty array at first") do
      expect(Human.all()).to(eq([]))
    end
  end
end
