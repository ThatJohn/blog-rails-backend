class StoriesController < ApplicationController
    def index
        @stories = Story.all
        render json: @stories, :include => {:user => {:only => :name}, :comments => {:only => :comment}}
    end

    def create
        @story = Story.create(story_params)
    end

    def show
        @story = Story.find(params[:id])
        render json: @story, :include => {:user => {:only => :name}}
    end

    def update
        @story = Story.find(params[:id])
        @story.update_attributes(story_params)
        render json: @story
    end
  
    def destroy
        @story = Story.find(params[:id])
        @story.destroy
        render json: @story
    end

    private
  
    def story_params
      params.require(:story).permit(:title, :body, :user_id)
    end
end
