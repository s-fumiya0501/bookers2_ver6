class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    if comment.save
      redirect_to book_path(book)
    else
      @error_comment = comment
      @book_comment = BookComment.new
      @book = Book.find(params[:id])
      @new_book = Book.new
      @user = @book.user
      render 'books/show'
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_back(fallback_location:root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
