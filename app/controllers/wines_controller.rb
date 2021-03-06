class WinesController < ApplicationController
  before_action :set_wine, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[new show create edit update destroy]

  def must_be_admin
      unless current_user && current_user.admin?
          redirect_to root_path, notice: "Can't access this section"
      end
  end

  # GET /wines or /wines.json
  def index
    @wines = Wine.all.order(name: :asc)
    @oenologists = Oenologist.all.order(dob: :desc)
  end

  # GET /wines/1 or /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    @wine = Wine.new
    @wine.wine_strains.build
    @strains = Strain.all.order(name: :asc)
    @oenologists = Oenologist.all.order(dob: :desc)
  end

  # GET /wines/1/edit
  def edit
    @strains = Strain.all.order(name: :asc)
    @oenologists = Oenologist.all.order(dob: :desc)
  end

  # POST /wines or /wines.json
  def create
    @wine = Wine.new(wine_params)

    respond_to do |format|
      if @wine.save
        format.html { redirect_to wine_url(@wine), notice: "Wine was successfully created." }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1 or /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to wine_url(@wine), notice: "Wine was successfully updated." }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1 or /wines/1.json
  def destroy
    @wine.destroy

    respond_to do |format|
      format.html { redirect_to wines_url, notice: "Wine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:name,:score, wine_strains_attributes: [:id, :strain_id, :percentage, :_destroy], oenologist_wines_attributes: [:id, :oenologist_id, :wine_id, :rate, :_destroy])
    end
end
