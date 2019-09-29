# frozen_string_literal: true

module Api::V1
  # Api::V1::TasksController
  #
  #   Uses for -------------
  class TasksController < ApplicationController

    def create
      task = Task.create(task_params.merge(project_id: params[:project_id]))
      if task.save
        render json: task,
               serializer: TaskSerializer,
               status: :created
      else
        render json: { errors: task.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def update
      resource.update!(task_params)
      head :no_content
    end

    def move
      MoveTask.new(move_params).call
      head :no_content
    end

    def destroy
      resource.destroy!
      head :no_content
    end

    private

    def resource
      Task.find_by(id: params[:id])
    end

    def move_params
      params.permit(:task_id, :increment)
    end

    def task_params
      params.require(:task).permit(
        :name,
        :deadline,
        :is_done
      )
    end
  end
end
