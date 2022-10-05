class CoursekeysController < ApplicationController
  # POST /cards or /cards.json
  def create
    @coursekey = Coursekey.new(coursekey_params)
    @coursekey.save
  end
end