class BarrelController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    render inertia: 'Barrels/Index', props: {
      inventory: Barrel.all
    }
  end

  def show
    render inertia: 'Barrels/Show', props: {
      barrel: Barrel.find(params[:id])
    }
  end

  def new
    render inertia: 'Barrels/New'
  end

  def edit
    render inertia: 'Barrels/Edit', props: {
      barrel: Barrel.find(params[:id])
    }
  end

  def create
    barrel = Barrel.create barrel_params

    if barrel.persisted?
      redirect_to barrel_index_path, notice: 'Barrel saved.'
    else
      redirect_to new_barrel_path, inertia: { errors: barrel.errors }
    end
  end

  def update
    if Barrel.find(params[:id]).update barrel_params
      redirect_to barrel_index_path, notice: 'Barrel saved.'
    else
      redirect_to edit_barrel_path, inertia: { errors: barrel.errors }
    end

    # if @organization.update(organization_params)
    #   redirect_to edit_organization_path(@organization), notice: 'Organization updated.'
    # else
    #   redirect_to edit_organization_path(@organization), inertia: { errors: @organization.errors }
    # end
  end

  def destroy
    Barrel.find(params[:id]).destroy
    redirect_to barrel_index_path, notice: 'Barrel was successfully deleted.'
  end

  private

  def barrel_params
    params.fetch(:barrel).permit(:id, :name, :description, :volume, :price)
  end
end
