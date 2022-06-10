class MagazineOenologistsController < ApplicationController
  before_action :set_magazine_oenologist, only: %i[ show edit update destroy ]
  before_action :must_be_admin, only: %i[new show create edit update destroy]

  def must_be_admin
      unless current_user && current_user.admin?
          redirect_to root_path, notice: "Can't access this section"
      end
  end

  # GET /magazine_oenologists or /magazine_oenologists.json
  def index
    @magazine_oenologists = MagazineOenologist.all
    @title = ['Editor', 'Writer', 'Reviewer']
  end

  # GET /magazine_oenologists/1 or /magazine_oenologists/1.json
  def show
    @title = ['Editor', 'Writer', 'Reviewer']
  end

  # GET /magazine_oenologists/new
  def new
    @magazine_oenologist = MagazineOenologist.new
    @title = ['Editor', 'Writer', 'Reviewer']
  end

  # GET /magazine_oenologists/1/edit
  def edit
    @title = ['Editor', 'Writer', 'Reviewer']
  end

  # POST /magazine_oenologists or /magazine_oenologists.json
  def create
    @magazine_oenologist = MagazineOenologist.new(magazine_oenologist_params)
    @title = ['Editor', 'Writer', 'Reviewer']

    respond_to do |format|
      if @magazine_oenologist.save
        format.html { redirect_to magazine_oenologist_url(@magazine_oenologist), notice: "Magazine oenologist was successfully created." }
        format.json { render :show, status: :created, location: @magazine_oenologist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @magazine_oenologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magazine_oenologists/1 or /magazine_oenologists/1.json
  def update
    respond_to do |format|
      if @magazine_oenologist.update(magazine_oenologist_params)
        format.html { redirect_to magazine_oenologist_url(@magazine_oenologist), notice: "Magazine oenologist was successfully updated." }
        format.json { render :show, status: :ok, location: @magazine_oenologist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @magazine_oenologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magazine_oenologists/1 or /magazine_oenologists/1.json
  def destroy
    @magazine_oenologist.destroy

    respond_to do |format|
      format.html { redirect_to magazine_oenologists_url, notice: "Magazine oenologist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine_oenologist
      @magazine_oenologist = MagazineOenologist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def magazine_oenologist_params
      params.require(:magazine_oenologist).permit(:id, :magazine_id, :oenologist_id, :title)
    end
end
