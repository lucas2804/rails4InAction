class HomeController < ApplicationController
  # :only OR :except
  before_filter :authenticate_user!, :only => [:index, :new]
  def index
  end
end