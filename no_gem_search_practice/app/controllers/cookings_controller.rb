class CookingsController < ApplicationController
  before_action :require_user

  def index
    @genres = Genre.all
    @cookings = Cooking.all

    # 料理名検索
    if params[:title].present?
      @cookings = @cookings.where("title LIKE ?", "%#{params[:title]}%")
    end

    # ジャンル検索
    if params[:genre_id].present?
      @cookings = @cookings.where(genre_id: params[:genre_id])
    end
  end

  def show
    @cooking = Cooking.find(params[:id])
  end

  def new
    @cooking = Cooking.new
    @genres = Genre.all
  end

  def create
    @cooking = current_user.cookings.new(cooking_params)
    if @cooking.save
      redirect_to cooking_path(@cooking)
    else
      @genres = Genre.all
      render :new
    end
  end

  private

  def cooking_params
    params.require(:cooking).permit(:title, :content, :genre_id)
  end
end
