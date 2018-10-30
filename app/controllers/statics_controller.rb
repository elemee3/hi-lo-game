class StaticsController < ApplicationController

  def home
    render "/home.html.erb"
  end

  def about
    render "/about.html.erb"
  end

  def goodbye
    @bye = "Goodbye, world"
    render "/goodbye.html.erb"
  end
end
