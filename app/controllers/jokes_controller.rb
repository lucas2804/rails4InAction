require 'json'
class JokesController < ApplicationController
  before_action :set_joke, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, :verify_policy_scoped

  def read_joke


    if session[:jokes_tracked].nil?
      session[:jokes_tracked] = Array.new
      session[:jokes_tracked] << 0
    else
      session[:jokes_tracked] = JSON.parse(session[:jokes_tracked])
    end
    # cookies.delete(:jokes_tracked)
    @joke = Joke.where.not(id: session[:jokes_tracked]).first
    session[:jokes_tracked] = session[:jokes_tracked].to_json
    if @joke.nil?
      # session.delete(:jokes_tracked)
      flash[:alert] = "That's all the jokes for today! Come back another day!"
    end

  end


  def update_un_like

    UserVote.create(voted: false, joke_id: params[:joke_id].to_i)
    joke_ids = JSON.parse(session[:jokes_tracked])
    joke_ids << params[:joke_id].to_i
    session[:jokes_tracked] = joke_ids.to_json
    format.js
      # redirect_to root_path
  end

  def update_like
    UserVote.create(voted: true, joke_id: params[:joke_id].to_i)
    joke_ids = JSON.parse(session[:jokes_tracked])
    joke_ids << params[:joke_id].to_i
    session[:jokes_tracked] = joke_ids.to_json


    #CLONE CODE FROM read_joke
    if session[:jokes_tracked].nil?
      session[:jokes_tracked] = Array.new
      session[:jokes_tracked] << 0
    else
      session[:jokes_tracked] = JSON.parse(session[:jokes_tracked])
    end
    # cookies.delete(:jokes_tracked)
    @joke = Joke.where.not(id: session[:jokes_tracked]).first
    session[:jokes_tracked] = session[:jokes_tracked].to_json
    if @joke.nil?
      # session.delete(:jokes_tracked)
      flash[:alert] = "That's all the jokes for today! Come back another day!"
    end
    flash[:alert] = "That's all the jokes for today! Come back another day!"

    respond_to do |format|
      format.js
    end
      # format.js @joke
    # redirect_to root_path
  end

  # GET /jokes
  # GET /jokes.json
  def index
    @jokes = Joke.all
  end

  # GET /jokes/1
  # GET /jokes/1.json
  def show
  end

  # GET /jokes/new
  def new
    @joke = Joke.new
  end

  # GET /jokes/1/edit
  def edit
  end

  # POST /jokes
  # POST /jokes.json
  def create
    @joke = Joke.new(joke_params)

    respond_to do |format|
      if @joke.save
        format.html { redirect_to @joke, notice: 'Joke was successfully created.' }
        format.json { render :show, status: :created, location: @joke }
      else
        format.html { render :new }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jokes/1
  # PATCH/PUT /jokes/1.json
  def update
    respond_to do |format|
      if @joke.update(joke_params)
        format.html { redirect_to @joke, notice: 'Joke was successfully updated.' }
        format.json { render :show, status: :ok, location: @joke }
      else
        format.html { render :edit }
        format.json { render json: @joke.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jokes/1
  # DELETE /jokes/1.json
  def destroy
    @joke.destroy
    respond_to do |format|
      format.html { redirect_to jokes_url, notice: 'Joke was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_joke
    @joke = Joke.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def joke_params
    params.require(:joke).permit(:name, :content, :joke_id)
  end
end
