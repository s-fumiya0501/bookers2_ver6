class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user=User.find(params[:id])
        @books=@user.books
        @book = Book.new
        @today_book = @books.created_today
        @yesterday_book = @books.created_yesterday
    end

    def index
        @user=current_user
        @users=User.all
        @book = Book.new
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to user_path(@user.id),notice:"You have updated user successfully."
        else
          render :edit
        end
    end

    def edit
        @user=User.find(params[:id])
        if @user.id!=current_user.id
            redirect_to user_path(current_user.id)
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :profile_image,:introduction)
    end

end
