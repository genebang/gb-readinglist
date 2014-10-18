class BooksController < ApplicationController

  def index
    @books = Book.search(params[:keyword])
  end
  
end
