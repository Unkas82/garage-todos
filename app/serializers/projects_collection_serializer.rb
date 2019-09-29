# frozen_string_literal: true

class ProjectsCollectionSerializer < ActiveModel::Serializer
  type :data
  attributes :name

  has_many :tasks
  has_many :comments, through: :tasks
end

