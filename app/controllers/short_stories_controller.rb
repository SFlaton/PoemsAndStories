class ShortStoriesController < ApplicationController
  before_filter :set_author

  def index
    @short_stories = @author.short_stories.order(publish_date: :asc)
  end

  def show
    @short_story = @author.short_stories.find(params[:id])
  end

  def new
    @short_story = ShortStory.new
  end

  def create
    @short_story = ShortStory.new(short_story_params)
    @short_story.author = @author

    respond_to do |f|
      if @short_story.save
        f.html {redirect_to [@author, @short_story], notice: "a new short story was created"}
        f.json {render :show, status: :created, location: [@author,@short_story]}
      else
        f.html {render :new}
        f.json {render json: @short_story.errors}
      end
    end
  end

  def edit
    @short_story = @author.short_stories.find(params[:id])
  end

  def update
    @short_story = @author.short_stories.find(params[:id])

    respond_to do |f|
      if @short_story.update(short_story_params)
        f.html {redirect_to [@author, @short_story], notice: "the short story was updated"}
        f.json {render :show, status: :ok, location: [@author,@short_story]}
      else
        f.html {render :edit}
        f.json {render json: @short_story.errors}
      end
    end
  end

  protected

  def set_author
    @author = Author.find(params[:author_id])
  end

  def short_story_params
    params.require(:short_story).permit(:title, :content, :description, :publish_date, :author)
  end
end
