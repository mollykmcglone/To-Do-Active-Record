require('spec_helper.rb')

describe(List) do

  describe('#tasks') do
      it("has many tasks") do
        test_list = List.create({:name => "list"})
        test_task1 = Task.create({:description => "task1", :list_id => test_list.id})
        test_task2 = Task.create({:description => "task2", :list_id => test_list.id})
       expect(test_list.tasks()).to(eq([test_task1, test_task2]))
      end
    end
end
