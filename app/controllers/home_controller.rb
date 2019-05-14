# Shows the Homepage
# frozen_string_literal: true

class HomeController < ApplicationController
  include HomeHelper
  def show
    @center = Center
  end
end
