class HomeController < ApplicationController
  def index
  end

  def profile
    @played = current_user.coursekeys
  end

  def map
  end

  def discbag
    @discbag = current_user.disckeys.map{ |key| Disc.find_by(id: key.pointer)}
  end
end
