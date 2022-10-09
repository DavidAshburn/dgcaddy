class HomeController < ApplicationController
  def index
  end

  def profile
    @played = current_user.coursekeys.map{ |key| Course.find_by(id: key.pointer)}
  end

  def map
  end

  def discbag
    @discs = current_user.disckeys.map{ |key| Disc.find_by(id: key.pointer)}
  end
end
