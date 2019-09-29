# frozen_string_literal: true

class CommentSerializer < ActiveModel::Serializer
  type :data
  attributes :task_id, :text
end
