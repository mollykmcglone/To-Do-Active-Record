require('rspec')
require('to_do')

describe(Task) do
  before() do
    Task.clear()
  end

  describe("#description") do
    it("gives the task a description") do
      test_task = Task.new("vacuum your car")
      expect(test_task.description()).to(eq("vacuum your car"))
    end
  end
  describe(".all") do
    it("an array that is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new("repair my bike tire")
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end
  describe(".clear") do
    it("empties the task array of all the saved tasks") do
    Task.new("do laundry").save()
    Task.clear()
    expect(Task.all()).to(eq([]))
    end
  end
end
