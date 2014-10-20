class BooksController < ApplicationController

  def index
    @books = Book.includes(:genres).search(params[:keyword]).filter(params[:filter])
    @genres = Genre.all
  end
  
end
