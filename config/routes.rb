Rails.application.routes.draw do
  get '/', to: 'telephone#login'
  get '/first_instr', to: 'telephone#first_instr'
  get '/next_instr', to: 'telephone#next_instr'
  get '/survey', to: 'telephone#survey'
  get '/finish', to: 'telephone#finish_survey'
  get '/format_data', to: 'telephone#format_data'
end
