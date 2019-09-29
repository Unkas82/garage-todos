# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ApplicationRecord

  has_many :tasks
  has_many :comments, through: :tasks

  validates :name, presence: true, allow_blank: false
end
