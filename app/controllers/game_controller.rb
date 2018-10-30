class GameController < ApplicationController

  def try
    session[:user] = params[:user] if session[:user].nil?
    if params[:number].to_i > get_secret.to_i
      @message = "high, guess again"
      @counter = get_counter
    elsif params[:number].to_i < get_secret.to_i
      @message = "low, guess again"
      @counter = get_counter
    else
      @message = "spot on! You win."
      @counter = get_counter
    end
    render "/game.html.erb"
  end

  def reset
    cookies.delete :counter
    reset_session
    render "/game.html.erb"
  end

  private
  def get_secret
    if session[:secret] == nil
      session[:secret] = rand(0..100)
      @secret = session[:secret]
    else
      @secret = session[:secret]
    end
  end

  def get_counter
    if cookies[:counter] == nil
      cookies[:counter] = 0
    else
      cookies[:counter] = cookies[:counter].to_i + 1
    end
  end
end
