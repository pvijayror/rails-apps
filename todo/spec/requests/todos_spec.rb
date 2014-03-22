require 'spec_helper'

describe "Todos" do
  describe "GET /tasks" do
    it "display  everydays task" do
      Task.create :task => 'make coffee'
      visit tasks_path
      page.should have_content 'make coffee'
    end

    it "create a new task" do
    	visit tasks_path
    	fill_in :Task, :with => 'do some exercise'
    	click_button 'Create Task'
    	current_path.should == tasks_path
    	page.should have_content 'do some exercise'
    end

    it "edit a task" do
    	@task = Task.create :task => 'A brand new task'
  		visit tasks_path

  		find("#task_#{@task.id}").click_link 'Edit'
  		current_path.should == edit_task_path(@task)
  		find_field('Task').value.should eq 'A brand new task'

  		
  		fill_in 'Task', :with => 'Updated task'

  		click_button 'Update Task'
  		page.should have_content 'Updated task'
  		
  	end	
  end
end
