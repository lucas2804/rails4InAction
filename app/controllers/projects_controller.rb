class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = policy_scope(Project)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    authorize @project, :show?
  end
  # GET /projects/1/edit
  def edit
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    authorize @project, :update?
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project has been updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        flash[:notie] = "Project has not been updated."
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for could not be found."
    redirect_to projects_path
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.fetch(:project).permit(:name, :description)
  end
end
