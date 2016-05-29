class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    respond_to do |f|
      if @author.save
        f.html {redirect_to @author, notice: "a new song was created"}
        f.json {render :show, status: :created, location: @author}
      else
        f.html {render :new}
        f.json {render json: @author.errors}
      end
    end
  end

  protected

  def author_params
    params.require(:author).permit(:name, :biography)
  end
end
