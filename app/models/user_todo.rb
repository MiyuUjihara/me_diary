class UserTodo < ApplicationRecord
  enum status: { incomplete: 0, completed: 1}

  belongs_to :user
  belongs_to :todo

  def status_completed?
    self.status == "completed"
  end

  def status_incomplete?
    self.status == "incomplete"
  end

end
