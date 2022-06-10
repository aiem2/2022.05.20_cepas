class OenologistWinesController < ApplicationController
  before_action :set_oenologist_wine, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[new show create edit update destroy]

  def must_be_admin
      unless current_user && current_user.admin?
          redirect_to root_path, notice: "Can't access this section"
      end
  end


  # GET /oenologist_wines or /oenologist_wines.json
  def index
    @oenologist_wines = OenologistWine.all
    @wines = Wine.all
    @oenologists = Oenologist.all.order(dob: :desc)
  end

  # GET /oenologist_wines/1 or /oenologist_wines/1.json
  def show
    @wines = Wine.all
    @oenologists = Oenologist.all.order(dob: :desc)
  end

  # GET /oenologist_wines/new
  def new
    @oenologist_wine = OenologistWine.new
    @wines = Wine.all
    @oenologists = Oenologist.all.order(dob: :desc)
  end

  # GET /oenologist_wines/1/edit
  def edit
    @wines = Wine.all
    @oenologists = Oenologist.all.order(dob: :desc)
  end

  # POST /oenologist_wines or /oenologist_wines.json
  def create
    @oenologist_wine = OenologistWine.new(oenologist_wine_params)
    @wines = Wine.all
    @oenologists = Oenologist.all.order(dob: :desc)
    respond_to do |format|
      if @oenologist_wine.save
        format.html { redirect_to oenologist_wine_url(@oenologist_wine), notice: "Oenologist wine was successfully created." }
        format.json { render :show, status: :created, location: @oenologist_wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oenologist_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oenologist_wines/1 or /oenologist_wines/1.json
  def update
    respond_to do |format|
      if @oenologist_wine.update(oenologist_wine_params)
        format.html { redirect_to oenologist_wine_url(@oenologist_wine), notice: "Oenologist wine was successfully updated." }
        format.json { render :show, status: :ok, location: @oenologist_wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oenologist_wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oenologist_wines/1 or /oenologist_wines/1.json
  def destroy
    @oenologist_wine.destroy

    respond_to do |format|
      format.html { redirect_to oenologist_wines_url, notice: "Oenologist wine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oenologist_wine
      @oenologist_wine = OenologistWine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oenologist_wine_params
      params.require(:oenologist_wine).permit(:id, :oenologist_id, :wine_id, :rate)
    end
end
