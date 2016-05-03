class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    authorize @ticket, :show?
    @comment = @ticket.comments.build(state_id: @ticket.state_id)
  end

  # GET /tickets/new

  def new
    @ticket = @project.tickets.build
    authorize @ticket, :create?
    1.times { @ticket.attachments.build }
  end

  # GET /tickets/1/edit
  def edit
    authorize @ticket, :update?
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = @project.tickets.new
    whitelisted_params = ticket_params
    unless policy(@ticket).tag?
      whitelisted_params.delete(:tag_names)
    end
    @ticket.attributes = whitelisted_params
    @ticket.author = current_user
    authorize @ticket, :create?
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to [@project, @ticket], notice: 'Ticket has been created."' }
        format.json { render :show, status: :created, location: @ticket }
      else
        flash[:notice] = 'Ticket has not been created.'
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    authorize @ticket, :update?
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to [@project, @ticket], notice: 'Ticket has been updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        flash[:notice] = 'Ticket has not been updated.'
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    authorize @ticket, :destroy?
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Ticket has been deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end



  # Never trust parameters from the scary internet, only allow the white list through.
  def ticket_params
    params.require(:ticket).permit(:name, :description, :tag_names,
                                   attachments_attributes: [:file, :file_cache])
  end
end
