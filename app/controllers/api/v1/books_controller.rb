class Api::V1::BooksController < ApplicationController
  def index

  end

  def create
    params = book_params
    @author = Author.find_by(name: params[:author_name])
    if !@author
      @author = Author.create(name: params[:name])
    end 
    @book = Book.create(name: params[:name])
    if @book.save
      @book.authors << @author
      render json: @book
    end
  end

  private

  def book_params
    params.permit(:name, :author_name)
  end
end
