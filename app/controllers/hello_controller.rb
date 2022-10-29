class HelloController < ApplicationController
  def world
    render inertia: 'Hello/World', props: {
      name: 'World'
    }
  end
end
