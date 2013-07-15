class BookRatingsController < ApplicationController
  
  load_and_authorize_resource
  
  def create
    @book_rating.user_id = current_user.id
    if @book_rating.save
      redirect_to @book_rating.book, notice: 'book_rating_created'
    else
      redirect_to @book_rating.book, notice: 'book_rating_not_created'
    end
  end
  
  def update
    if @book_rating.update_attributes(params[:book_rating])
      redirect_to @book_rating.book, notice: 'book_rating_updated'
    else
      redirect_to @book_rating.book, notice: 'book_rating_not_updated'
    end
  end
end
