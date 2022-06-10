class OenologistsController < ApplicationController
  before_action :set_oenologist, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[new show create edit update destroy]

  def must_be_admin
      unless current_user && current_user.admin?
          redirect_to root_path, notice: "Can't access this section"
      end
  end

  # GET /oenologists or /oenologists.json
  def index
    @oenologists = Oenologist.all
    @magazines = Magazine.all
    @jobs = ['Editor', 'Writer', 'Reviewer']
  end

  # GET /oenologists/1 or /oenologists/1.json
  def show
    @magazines = Magazine.all
    @jobs = ['Editor', 'Writer', 'Reviewer']
  end

  # GET /oenologists/new
  def new
    @oenologist = Oenologist.new
    @magazines = Magazine.all
    @jobs = ['Editor', 'Writer', 'Reviewer']
  end

  # GET /oenologists/1/edit
  def edit
    @magazines = Magazine.all
    @jobs = ['Editor', 'Writer', 'Reviewer']
  end

  # POST /oenologists or /oenologists.json
  def create
    @oenologist = Oenologist.new(oenologist_params)
    @magazines = Magazine.all
    @jobs = ['Editor', 'Writer', 'Reviewer']

    respond_to do |format|
      if @oenologist.save
        format.html { redirect_to oenologist_url(@oenologist), notice: "Oenologist was successfully created." }
        format.json { render :show, status: :created, location: @oenologist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oenologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oenologists/1 or /oenologists/1.json
  def update
    respond_to do |format|
      if @oenologist.update(oenologist_params)
        format.html { redirect_to oenologist_url(@oenologist), notice: "Oenologist was successfully updated." }
        format.json { render :show, status: :ok, location: @oenologist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oenologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oenologists/1 or /oenologists/1.json
  def destroy
    @oenologist.destroy

    respond_to do |format|
      format.html { redirect_to oenologists_url, notice: "Oenologist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oenologist
      @oenologist = Oenologist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oenologist_params
      @magazine = Magazine.all
      params.require(:oenologist).permit(:name, :dob, :nationality, magazine_oenologists_attributes: [:id, :magazine_id, :oenologist_id, :title, :_destroy],
        oenologist_wines_attributes: [:id, :oenologist_id, :wine_id, :rate, :_destroy])
    end
end
