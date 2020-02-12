class BooksController < ApplicationController
	def index
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def create
		book = Book.new(book_params)
		if book.save
			redirect_to books_path(@book)
			flash[:notice] = Book was successfully updated.
		else
			@book = book
			@books = Book.all
			render action: :index
		end
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
		   redirect_to books_path
		   flash[:notice] = Book was successfully updated.
		else
			@book = book
			render action: :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
		flash[:notice] = Book was successfully destroyed.
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end