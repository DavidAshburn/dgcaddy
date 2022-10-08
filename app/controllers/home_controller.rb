class HomeController < ApplicationController
  def index
  end

  def profile
    @playedcourses = Array.new
    @list = current_user.coursekeys
    if @list
      current_user.coursekeys.each do |key|
        thiscourse = Course.find(key.pointer)
        @playedcourses.push(thiscourse.name)
      end
    end
  end

  def map
  end

  def discbag
    @list = current_user.disckeys.map{|key| Disc.find_by(id:key.pointer)}
  end
end
