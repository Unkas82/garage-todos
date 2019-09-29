# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  project_id :integer          not null
#  name       :string           not null
#  deadline   :time
#  index      :integer
#  is_done    :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord

  has_many :comments

  belongs_to :project

  before_save :fill_index

  validates :name, presence: true, allow_blank: false

  def fill_index
    return unless new_record?

    self.index = project.tasks.pluck(:index).max.to_i + 1
  end
end
