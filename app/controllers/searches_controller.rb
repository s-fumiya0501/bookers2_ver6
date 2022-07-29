class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search_tag
    @tag = params[:tag]
    @books = Book.where("tag LIKE?", "#{@tag}")
  end
end
