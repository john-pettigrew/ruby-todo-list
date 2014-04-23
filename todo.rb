=begin
	Simple todo list program written in Ruby
	by John Pettigrew.
=end

class Todo_List
	def initialize()
		@list =  []
	end
	def add(title, completed, due)
		puts "	(added "+ title + ")"
		@list << Todo_List_Item.new(title, completed, due)
	end
	def get_list()
		return @list
	end
	def print_list
		@list.each do |item|
			if item.get_completed == false
				puts item.get_title + " - " + item.get_due_date + "\n"
			end
		end
	end
	def complete(item, remove)
		puts "	(Completed "+item+")"
		for i in (0 ... @list.length-1)
			if item == @list[i].get_title
				@list[i].complete
				if remove
					@list.delete_at(i)
				end
			end
		end
	end
end

class Todo_List_Item
	def initialize(title, completed, due)
		@title = title
		@title.capitalize!
		@completed = completed
		@due = due
	end
	def complete()
		@completed = true
	end
	def get_title
		return @title
	end
	def get_completed
		return @completed
	end
	def get_due_date
		return @due
	end

end

#Testing - creation
list = Todo_List.new
list.add("Program", false, "Today")
list.add("Workout", false, "Today")
list.add("Swim", false, "Today")

#Testing printing
puts "\nPrinting Test"
list.print_list

#testing completion
puts "\nCompletion Test"
list.complete("Program", true)
list.print_list
