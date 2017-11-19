class AreasController < ApplicationController
  before_action :area_params, only: [:add, :show, :update]

  def index
    @root = Area.root
    render json: @root
  end

  def show
    render json: @area
  end

  def add
    @area.children.create action_params
    redirect_to action: 'show'
  end

  def update
    @area.update action_params
    redirect_to action: 'show', id: @area.parent_id
  end

  private

    def area_params
      @area ||= Area.find_by(id: params[:id])
      if @area.nil?
        redirect_to :action => "index"
      end
    end

    def action_params
      params.require(:area).permit(:name, :grade)
    end
end
