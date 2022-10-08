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
  end
end
