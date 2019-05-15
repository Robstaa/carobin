# Shows the Homepage
# frozen_string_literal: true

class HomeController < ApplicationController
  include HomeHelper
  def show
    @center = Center
    @markers = Place.all.to_json.html_safe
  end
end
