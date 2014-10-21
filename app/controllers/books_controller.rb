class BooksController < ApplicationController

  def index
    @books = Book.includes(:genres).search(params[:keyword]).filter(params[:filter])
    @genres = Genre.all
  end

  def create
    @book = Book.new(book_params)
    
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was created"}
        format.json { render :show, status: :created, location: @book }
        format.js
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end

  private

    def book_params
      params.require(:book).permit(:title, :author, :description, :amazon_id, :rating, {genre_ids: []})
    end
  
end
