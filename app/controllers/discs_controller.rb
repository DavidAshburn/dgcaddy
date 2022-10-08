class DiscsController < ApplicationController
  before_action :set_disc, only: %i[ show edit update destroy ]

  # GET /discs or /discs.json
  def index
    @list = current_user.disckeys.map{|key| Disc.find_by(id:key.pointer)}
    
    if params[:fmaker].present? 
      @mak = params[:fmaker].downcase
    end
    
    if params[:fmodel].present? 
      @mod = params[:fmodel].downcase
    end
    
    if @mod
      if @mak
        @discs = Disc.where("LOWER(maker) LIKE ?", "%" + @mak + "%").or(Disc.where("LOWER(model) LIKE ?", "%" + @mod + "%")).order('maker, model')
      else
        @discs = Disc.where("LOWER(model) LIKE ?", "%" + @mod + "%").order('maker, model')
      end
    else
      if @mak
        @discs = Disc.where("LOWER(maker) LIKE ?", "%" + @mak + "%").order('maker, model')
      else
        @discs = Disc.find_by(model: "Zone")
      end
    end
  end

  # GET /discs/1 or /discs/1.json
  def show
  end

  # GET /discs/new
  def new
    @disc = Disc.new
  end

  # GET /discs/1/edit
  def edit
    @disckey = current_user.disckeys.find_by(pointer:@disc.id)
  end

  # POST /discs or /discs.json
  def create
    @disc = Disc.new(disc_params)

    respond_to do |format|
      if @disc.save
        format.html { redirect_to disc_url(@disc), notice: "Disc was successfully created." }
        format.json { render :show, status: :created, location: @disc }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discs/1 or /discs/1.json
  def update
    respond_to do |format|
      if @disc.update(disc_params)
        format.html { redirect_to disc_url(@disc), notice: "Disc was successfully updated." }
        format.json { render :show, status: :ok, location: @disc }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discs/1 or /discs/1.json
  def destroy
    @disc.destroy

    respond_to do |format|
      format.html { redirect_to discs_url, notice: "Disc was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disc
      @disc = Disc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def disc_params
      params.require(:disc).permit(:weight, :maker, :model, :user_id, :diameter, :height, :depth, :rimdiameter, :rimthickness, :rimratio, :rimconfig, :flexibility, :speed, :glide, :turn, :fade, :fmaker, :fmodel)
    end
end
