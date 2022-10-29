class StorefrontController < ApplicationController
  def index
    render inertia: 'Storefront/Index', props: {
      inventory: Barrel.all
    }
  end
end
