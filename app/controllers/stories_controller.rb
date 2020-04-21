class StoriesController < ApplicationController
    def index
        @stories = Story.all
        render json: @stories, :include => {:user => {:only => :name}, :comments => {:only => :comment}}
    end

    private
  
    def story_params
      params.require(:story).permit(:title, :body, :user_id)
    end
end
