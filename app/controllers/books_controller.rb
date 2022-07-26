class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.new
    @books = Book.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @user = current_user
  end

  def show
    @book_comment = BookComment.new
    @book = Book.find(params[:id])
    @new_book = Book.new
    @user = @book.user
    unless ViewCount.find_by(user_id: current_user.id, book_id: @book.id)
      current_user.view_counts.create(book_id: @book.id)
    end
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id!=current_user.id
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id),notice: 'You have created book successfully.'
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book),notice:"You have updated book successfully."
    else
      render :edit
    end
  end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
