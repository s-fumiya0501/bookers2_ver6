class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user=User.find(params[:id])
        @books=@user.books
        @book = Book.new
        @today_book = @books.created_today
        @yesterday_book = @books.created_yesterday
        @this_week_book = @books.created_this_week
        @last_week_book = @books.created_last_week
    end

    def index
        @user=current_user
        @users=User.all
        @book = Book.new
    end

    def search
        @user = User.find(params[:user_id])
        @books = @user.books 
        @book = Book.new
        if params[:created_at] == ""
          @search_book = "日付を選択してください"
        else
          create_at = params[:created_at]
          @search_book = @books.where(['created_at LIKE ? ', "#{create_at}%"]).count
        end
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
