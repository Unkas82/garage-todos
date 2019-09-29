# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  type :data
  attributes :project_id, :name, :deadline, :index, :is_done
end
