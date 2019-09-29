# frozen_string_literal: true

module Api::V1
  # Api::V1::ProjectsController
  #
  #   Uses for all projects data
  class ProjectsController < ApplicationController

    def index
      render json: collection,
             each_serializer: ProjectsCollectionSerializer,
             status: :ok
    end

    def create
      project = Project.create(project_params)
      if project.save
        render json: { name: project.name },
               status: :created
      else
        render json: { errors: project.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def update
      resource.update!(project_params)
      head :no_content
    end

    def destroy
      resource.destroy!
      head :no_content
    end

    private

    def collection
      Project.all
    end

    def resource
      Project.find_by(id: params[:id])
    end

    def project_params
      params.permit(:name)
    end
  end
end
