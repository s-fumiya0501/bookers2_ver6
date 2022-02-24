class UsersController < ApplicationController
    def show
        @user=User.find(params[:id])
        @books=@user.books
        @book = Book.new
    end

    def index
        @user=current_user
        @users=Book.all
        @book = Book.new
    end

end
