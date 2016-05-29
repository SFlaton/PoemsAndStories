class PoemsController < ApplicationController
  before_filter :set_author

  def index
    @poems = @author.poems.order(publish_date: :asc)
  end

  def show
    @poem = @author.poems.find(params[:id])
  end

  def new
    @poem = Poem.new
  end

  def create
    @poem = Poem.new(poem_params)
    @poem.author = @author

    respond_to do |f|
      if @poem.save
        f.html {redirect_to [@author, @poem], notice: "a new poem was created"}
        f.json {render :show, status: :created, location: [@author,@poem]}
      else
        f.html {render :new}
        f.json {render json: @poem.errors}
      end
    end
  end

  def edit
    @poem = @author.poems.find(params[:id])
  end

  def update
    @poem = @author.poems.find(params[:id])

    respond_to do |f|
      if @poem.update(poem_params)
        f.html {redirect_to [@author, @poem], notice: "the poem was updated"}
        f.json {render :show, status: :ok, location: [@author,@poem]}
      else
        f.html {render :edit}
        f.json {render json: @poem.errors}
      end
    end
  end

  protected

  def set_author
    @author = Author.find(params[:author_id])
  end

  def poem_params
    params.require(:poem).permit(:title, :content, :methaphor, :publish_date, :author)
  end
end
