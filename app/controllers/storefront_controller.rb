class StorefrontController < ApplicationController
  def index
    render inertia: 'Storefront/Index', props: {
      inventory: Barrel.with_attached_image.all.map do |barrel|
        barrel.as_json.merge({
          image_url: barrel.image.attached? ?
            url_for(barrel.image.variant(resize_to_fill: [260, 260])) :
            'https://via.placeholder.com/160/fff/fff'
        })
      end
    }
  end

  def cart
    render inertia: 'Storefront/Index', props: {
      cart: Barrel.all
    }
  end
end
