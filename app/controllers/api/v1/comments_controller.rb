# frozen_string_literal: true

module Api::V1
  # Api::V1::CommentsController
  #
  #   Uses for -----------
  class CommentsController < ApplicationController

    def create
      comment = Comment.create(project_params)
      if comment.save
        render json: comment,
               serializer: CommentSerializer,
               status: :created
      else
        render json: { errors: comment.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    def update
      resource.update!(comment_params)
      head :no_content
    end

    def destroy
      resource.destroy!
      head :no_content
    end

    private

    def resource
      Comment.find_by(id: params[:id])
    end

    def comment_params
      params.permit(:text)
    end
  end
end
