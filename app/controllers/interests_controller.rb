class InterestsController < ApplicationController
  before_action :set_interest, only: [:show, :edit, :update, :destroy]

  # GET /interests
  # GET /interests.json
  def index
    @interests = Interest.all
  end

  # GET /interests/1
  # GET /interests/1.json
  def show
  end

  # GET /interests/new
  def new
    @interest = Interest.new
  end

  # GET /interests/1/edit
  def edit
  end

  # POST /interests
  # POST /interests.json
  def create
    @user = User.find(params[:user])
    @animal = Animal.find(params[:animal])
    @interest = Interest.new(user_id: @user.id, animal_id: @animal.id, date: Date.today)

    respond_to do |format|
      if @interest.save
        format.html { redirect_to :back, notice: 'You sent an interest to the animal' }
        format.json { head :no_content }
      else
        format.html { redirect_to animals_url, notice: @interest.errors.full_messages[0] }
        format.json { head :no_content }
      end
    end
  end

  # PATCH/PUT /interests/1
  # PATCH/PUT /interests/1.json
  def update
    respond_to do |format|
      if @interest.update(interest_params)
        format.html { redirect_to animals_url, notice: 'You sent an interest to the animal' }
        format.json { head :no_content }
      else
        format.html { redirect_to animals_url, notice: @interest.errors.full_messages[0] }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /interests/1
  # DELETE /interests/1.json
  def destroy
    @interest.destroy
    respond_to do |format|
      format.html { redirect_to interests_url, notice: 'Interest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mail
    @user = User.find(params[:user])
    @animal = Animal.find(params[:animal])
    @animal.active = false
    @animal.save
        # Provide an email confirmation if all is good...
    FriendMailer.new_friend_announcement(@user).deliver

    # Now a page confirmation as well...
    flash[:notice] = "Your interest has been sent!"
    redirect_to interests_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interest
      @interest = Interest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interest_params
      params.require(:interest).permit(:user_id, :animal_id, :date)
    end
end
