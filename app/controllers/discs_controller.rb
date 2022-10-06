class DiscsController < ApplicationController

  def create
    @disc = Disc.new(disc_params)
    @disc.save
  end

  private

    # Only allow a list of trusted parameters through.
    def disckey_params
      params.require(:disc, :manufacturer, :name, :speed, :glide, :turn, :fade, :user_id).permit(:diameter, :height, :rimdepth, :rimwidth)
    end