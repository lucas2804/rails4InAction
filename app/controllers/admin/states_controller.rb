class Admin::StatesController < Admin::ApplicationController

  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET /admin/states
  # GET /admin/states.json
  def index
    @states = State.all
  end

  # GET /admin/states/1
  # GET /admin/states/1.json
  def show
  end

  # GET /admin/states/new
  def new
    @state = State.new
  end


  def create
    @state = State.new(state_params)
    if @state.save
      flash[:notice] = "State has been created."
      redirect_to admin_states_path
    else
      flash.now[:alert] = "State has not been created."
      render "new"
    end
  end

  def make_default
    @state = State.find(params[:id])
    @state.make_default!
    flash[:notice] = "'#{@state.name}' is now the default state."
    redirect_to admin_states_path
  end

  private

  def state_params
    params.require(:state).permit(:name, :color)
  end

  def set_user
    @state = State.find(params[:id])
  end

end

