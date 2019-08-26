Rails.application.routes.draw do
  root to: "dashboard#index"

  scope module: 'api', path: '/api' do
    post :webhooks, action: :receive, controller: 'webhooks'
  end
end
