class VariantsController < ApplicationController
  before_action :set_variant, only: %i[ show edit update destroy ]

  # GET /variants/1 or /variants/1.json
  def show
    @course = Course.find(@variant.course_id)
    @pars = @variant.pars.split('')
    @cardlist = Card.all.where(user_id: current_user.id, variant_id: @variant.id)
    @totalpar = 0
    @pars.each do |x|
      @totalpar += x.to_i
    end
  end

  # GET /variants/new
  def new
    @variant = Variant.new
    @course_id = params[:course_id]
    @par_options = [[3,4,5], 3]
  end

  # GET /variants/1/edit
  def edit
    @course = Course.find(@variant.course_id)
  end

  # POST /variants or /variants.json
  def create
    @variant = Variant.new(variant_params)

    respond_to do |format|
      if @variant.save
        format.html { redirect_to variant_url(@variant), notice: "Layout was successfully created." }
        format.json { render :show, status: :created, location: @variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variants/1 or /variants/1.json
  def update
    respond_to do |format|
      if @variant.update(variant_params)
        format.html { redirect_to variant_url(@variant), notice: "Layout was successfully updated." }
        format.json { render :show, status: :ok, location: @variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /variants/1 or /variants/1.json
  def destroy
    @variant.destroy

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Layout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variant_params
      params.require(:variant).permit(:name, :length, :pars, :course_id)
    end
end
