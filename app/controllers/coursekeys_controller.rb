class CoursekeysController < ApplicationController
  # POST /cards or /cards.json
  def create
    @coursekey = Coursekey.new(coursekey_params)
    @coursekey.save
  end

  private

    # Only allow a list of trusted parameters through.
    def coursekey_params
      params.require(:coursekey).permit(:pointer, :count, :user_id)
    end
end