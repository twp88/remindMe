Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reminders
  get 'reminders/send_todays_messages' => 'reminders#send_todays_messages'

  resources :users

  root to: "reminders#index"
end
