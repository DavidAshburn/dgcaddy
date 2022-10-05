class DiscsController < ApplicationController

  def create
    @disc = Disc.new(disc_params)
    @disc.save
  end

end