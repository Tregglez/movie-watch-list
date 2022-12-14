class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show
    @review = Review.new(list: @list)
  end

  def new
    @list = List.new
  end

  def edit; end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to root_path
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
