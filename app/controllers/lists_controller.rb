class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
  end
  
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "list successfully created"
      redirect_to @list
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end
  
  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
