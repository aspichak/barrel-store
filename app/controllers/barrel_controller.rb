class BarrelController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_barrel, only: %i[ show edit update destroy ]

  def index
    render inertia: 'Barrels/Index', props: {
      inventory: Barrel.all
    }
  end

  def show
    render inertia: 'Barrels/Show', props: {
      barrel: @barrel
    }
  end

  def new
    render inertia: 'Barrels/New'
  end

  def edit
    render inertia: 'Barrels/Edit', props: {
      barrel: @barrel
    }
  end

  def create
    if Barrel.new(barrel_params).save
      redirect_to barrel_index_path, notice: 'Barrel saved.'
    else
      redirect_to new_barrel_path, inertia: { errors: barrel.errors }
    end
  end

  def update
    if @barrel.update(barrel_params)
      redirect_to barrel_index_path, notice: 'Barrel saved.'
    else
      redirect_to edit_barrel_path, inertia: { errors: barrel.errors }
    end
  end

  def destroy
    Barrel.find(params[:id]).destroy
    redirect_to barrel_index_path, notice: 'Barrel was successfully deleted.'
  end

  private

  def set_barrel
    @barrel = Barrel.find(params[:id])
  end

  def barrel_params
    params.fetch(:barrel).permit(:id, :name, :description, :volume, :price)
  end
end
