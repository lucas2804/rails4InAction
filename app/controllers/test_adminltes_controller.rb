class TestAdminltesController < ApplicationController
  before_action :set_test_adminlte, only: [:show, :edit, :update, :destroy]

  # GET /test_adminltes
  # GET /test_adminltes.json
  def index
    @test_adminltes = TestAdminlte.all
  end

  # GET /test_adminltes/1
  # GET /test_adminltes/1.json
  def show
  end

  # GET /test_adminltes/new
  def new
    @test_adminlte = TestAdminlte.new
  end

  # GET /test_adminltes/1/edit
  def edit
  end

  # POST /test_adminltes
  # POST /test_adminltes.json
  def create
    @test_adminlte = TestAdminlte.new(test_adminlte_params)

    respond_to do |format|
      if @test_adminlte.save
        format.html { redirect_to @test_adminlte, notice: 'Test adminlte was successfully created.' }
        format.json { render :show, status: :created, location: @test_adminlte }
      else
        format.html { render :new }
        format.json { render json: @test_adminlte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_adminltes/1
  # PATCH/PUT /test_adminltes/1.json
  def update
    respond_to do |format|
      if @test_adminlte.update(test_adminlte_params)
        format.html { redirect_to @test_adminlte, notice: 'Test adminlte was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_adminlte }
      else
        format.html { render :edit }
        format.json { render json: @test_adminlte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_adminltes/1
  # DELETE /test_adminltes/1.json
  def destroy
    @test_adminlte.destroy
    respond_to do |format|
      format.html { redirect_to test_adminltes_url, notice: 'Test adminlte was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_adminlte
      @test_adminlte = TestAdminlte.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_adminlte_params
      params.fetch(:test_adminlte, {})
    end
end
