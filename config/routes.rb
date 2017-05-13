Rails.application.routes.draw do
  get '/', to: 'telephone#login'
  get '/home', to: 'telephone#survey'
  get '/start', to: 'telephone#start_survey'
  get '/finish', to: 'telephone#finish_survey'
  get '/format_data', to: 'telephone#format_data'
end
