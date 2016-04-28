class HomeController < ApplicationController
  # :only OR :except
  before_filter :authenticate_user!, :only => [:index, :new]
  skip_after_action :verify_authorized, :verify_policy_scoped
  def index
  end
end
