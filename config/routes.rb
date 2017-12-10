Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reminders
  get 'reminders/send_all' => 'reminders#send_all'
end
