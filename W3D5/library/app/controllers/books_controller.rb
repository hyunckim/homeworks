class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def new
    # your code here
  end

  def create
    books = Book.new(book_params)

    if books.save
      redirect_to action: "index"
    else
      render json: books.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find_by(id: params[:id])

    if book.destroy
      redirect_to action: "index"
    else
      render json: books.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
