class Task
    attr_reader :content, :id, :completed, :created_at, :updated_at
    @@current_id = 1
    def initialize(content, completed=false)
        @content = content
        @completed = completed
        @id = @@current_id
        @completed = false
        @created_at = Time.now
        @updated_at = nil
        @@current_id += 1
    end
    def complete?
      @completed
    end
    def complete!
      @completed = true
    end
    def make_incomplete!
      @completed = false
    end
    def update_content!(update)
      @content = update
      @updated_at = Time.now
    end
end

class TodoList
    attr_reader :tasks, :user
    def initialize buyer
        @tasks = []
        @user = buyer
    end
    def add_task task
        @tasks << task
    end
    def delete_task task_id
      @tasks.delete_if { |task| task.id == task_id }
    end
    def find_task_by_id task_id
      @task = @tasks.find { |task| task.id == task_id }
    end
    def sort_by_created order_by = "DESC"
    if(order_by == "DESC")
      @tasks.sort do | task1, task2 |
        task2.created_at <=> task1.created_at
      end
    elsif(order_by == "ASC")
      @tasks.sort do | task1, task2 |
        task1.created_at <=> task2.created_at
      end
    end
    end
end

# task = Task.new("Buy the milk")
# puts task.complete?
# puts task.complete!
# # 1
# task2 = Task.new("Wash the car")
# puts task.complete?
# puts task.complete!
# # 2



 task = Task.new("Buy the dog")
# puts task.content 
# # Buy the dog
 task2 = Task.new("Walk the milk")
# puts task2.content 
# # Walk the milk
 task.update_content!("Buy the milk")
 task2.update_content!("Walk the dog")
# puts task.content 
# # Buy the milk
# puts task2.content 
# # Walk the dog

todo_list = TodoList.new("Pau")
todo_list.add_task(Task.new("Walk the dog"))
todo_list.add_task(Task.new("Buy the milk"))
task = todo_list.find_task_by_id(1)
#puts task.content
puts todo_list.sort_by_created

