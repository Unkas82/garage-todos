# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  task_id    :integer          not null
#  text       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

  belongs_to :task

  validates :text, presence: true, allow_blank: false
end
