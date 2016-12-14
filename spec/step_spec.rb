require('spec_helper')

describe(Step) do
  describe('tests step for properties') do
    it('tests for description') do
      step = Step.create({:description => "Preheat oven at 325 degrees"})
      expect(step.description).to(eq("Preheat oven at 325 degrees"))
    end
  end
end
