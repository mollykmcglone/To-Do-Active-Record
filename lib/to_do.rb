class Task
  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM to_do;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
    tasks
  end

  define_method(:save) do
    DB.exec("INSERT INTO to_do (description, list_id) VALUES ('#{@description}', #{@list_id});")
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
  end
end
