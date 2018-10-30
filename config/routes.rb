Rails.application.routes.draw do
  root 'statics#home'
  get '/about' => 'statics#about'
  get '/goodbye' => 'statics#goodbye'
  get '/game' => 'game#try'
  get '/new_game' => 'game#reset'
end
