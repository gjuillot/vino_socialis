class BooksController < ApplicationController
  
  load_and_authorize_resource
  
  def index
  end

  def show
    if user_signed_in?
      @book_rating = BookRating.where('book_id = ? AND user_id = ?', @book.id, current_user.id).first || BookRating.new
    end
  end
  
  def new
  end

  def create
    @book.user_id = current_user.id
    @book.validation = false
    if @book.save
      redirect_to @book, notice: 'book_created'
    else
      render action: "new"
    end
  end
  
  def edit
  end
  
  def update
    if @book.update_attributes(params[:book])
      redirect_to books_moderations_path
    else
      render action: "edit"
    end
  end
  
  def validate
    @book.validation = true
    if @book.save
      UserMailer.book_validated(@book).deliver
    end
    redirect_to books_moderations_path
  end
  
  def own
    library = Library.new
    library.book_id = @book.id
    library.user_id = current_user.id
    library.save
    redirect_to books_user_path(current_user)
  end
  
  def comment
    comment = @book.comments.new
    comment.comment = params[:comment][:comment]
    comment.user = current_user
    comment.save
    redirect_to @book
  end
end
