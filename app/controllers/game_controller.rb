class GameController < ApplicationController

  def try
    session[:user] = params[:user] if session[:user].nil?
    cookies[:wincount] = 0 if cookies[:wincount].nil?
    if params[:number].to_i > get_secret.to_i
      @message = "high, guess again"
      @counter = get_counter
    elsif params[:number].to_i < get_secret.to_i
      @message = "low, guess again"
      @counter = get_counter
    else
      @message = "spot on! You win."
      @counter = get_counter
      cookies[:wincount] = cookies[:wincount].to_i + 1
      cookies[:player] = session[:user]
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
    session[:secret] = rand(0..100) if session[:secret] == nil
    @secret = session[:secret]
  end

  def get_counter
    if cookies[:counter] == nil
      cookies[:counter] = 0
    else
      cookies[:counter] = cookies[:counter].to_i + 1
    end
  end
end
