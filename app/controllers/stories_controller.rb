class StoriesController < ApplicationController
    def index
        @stories = Story.all
        render json: @stories, :include => {:user => {:only => :name}, :comments => {:only => :comment}}
    end
end
