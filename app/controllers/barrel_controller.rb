class BarrelController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_barrel, only: %i[show edit update destroy]

  def index
    render inertia: 'Barrels/Index', props: {
      inventory: Barrel.with_attached_image.all.map do |barrel|
        barrel.as_json.merge({
          image_url: barrel.image.attached? ?
            url_for(barrel.image.variant(resize_to_fill: [48, 48])) :
            'https://via.placeholder.com/48/fff/fff'
        })
      end
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
    barrel = Barrel.new(barrel_params)

    if barrel.save
      redirect_to barrel_index_path, notice: 'Barrel saved.'
    else
      redirect_to new_barrel_path, inertia: { errors: barrel.errors }
    end
  end

  def update
    if @barrel.update(barrel_params)
      redirect_to barrel_index_path, notice: 'Barrel saved.'
    else
      redirect_to edit_barrel_path, inertia: { errors: @barrel.errors }
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
    params.permit(:id, :name, :description, :volume, :price, :image).tap do |p|
      p.delete(:image) if p[:image].blank?
    end
  end
end
