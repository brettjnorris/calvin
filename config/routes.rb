Rails.application.routes.draw do
  scope module: 'api', path: '/api' do
    post :webhooks, action: :receive, controller: 'webhooks'
  end
end
