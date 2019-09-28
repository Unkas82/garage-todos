class Task < ApplicationRecord

  has_many :comments

  belongs_to :project

  before_save :fill_index if :new_record?

  def fill_index
    self.index = self.project.tasks.count
  end
end
