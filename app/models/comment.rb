# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  task_id    :integer          not null
#  text       :text             not null
#  file       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

  belongs_to :task

  mount_uploader :file, FileUploader

  validates :text, presence: true, allow_blank: false

  validates :file, file_size: {
                    less_than_or_equal_to: 10.megabytes,
                    message: 'An uploaded file is too large. The size shouldn’t exceed 10 MB.'
                  },
                   file_content_type: {
                    allow: ['jpg', 'png'],
                    message: 'Wrong file format. You can upload a *.jpg or *.png formats files only'
                  }
end
