class DisckeysController < ApplicationController
  before_action :set_disckey, only: %i[ destroy ]

  # POST /cards or /cards.json
  def create
    @disckey = Disckey.new(disckey_params)
    @disckey.save
  end

  def destroy
    @disckey.destroy

    respond_to do |format|
      format.html { redirect_to home_discbag_path, notice: "Disc removed from bag." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disckey
      @disckey = disckey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def disckey_params
      params.require(:disckey).permit(:pointer, :user_id)
    end
end