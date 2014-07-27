class SessionsController < ApplicationController
  def create
    user = User.from_omniauth env['omniauth.auth']
    session[:user_id] = user.id
    redirect_to trello_index_path, notice: 'Logged in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_sessions_path, notice: 'Logged out!'
  end
end
