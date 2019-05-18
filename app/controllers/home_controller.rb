# Shows the Homepage
# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @center = CenterService
    @markers = Place.all.to_json.html_safe
  end
end
