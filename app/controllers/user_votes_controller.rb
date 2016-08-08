class UserVotesController < ApplicationController
  before_action :set_user_vote, only: [:show, :edit, :update, :destroy]

  # GET /user_votes
  # GET /user_votes.json
  def index
    @user_votes = UserVote.all
  end

  # GET /user_votes/1
  # GET /user_votes/1.json
  def show
  end

  # GET /user_votes/new
  def new
    @user_vote = UserVote.new
  end

  # GET /user_votes/1/edit
  def edit
  end

  # POST /user_votes
  # POST /user_votes.json
  def create
    @user_vote = UserVote.new(user_vote_params)

    respond_to do |format|
      if @user_vote.save
        format.html { redirect_to @user_vote, notice: 'User vote was successfully created.' }
        format.json { render :show, status: :created, location: @user_vote }
      else
        format.html { render :new }
        format.json { render json: @user_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_votes/1
  # PATCH/PUT /user_votes/1.json
  def update
    respond_to do |format|
      if @user_vote.update(user_vote_params)
        format.html { redirect_to @user_vote, notice: 'User vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_vote }
      else
        format.html { render :edit }
        format.json { render json: @user_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_votes/1
  # DELETE /user_votes/1.json
  def destroy
    @user_vote.destroy
    respond_to do |format|
      format.html { redirect_to user_votes_url, notice: 'User vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_vote
      @user_vote = UserVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_vote_params
      params.require(:user_vote).permit(:user_id, :joke_id)
    end
end
