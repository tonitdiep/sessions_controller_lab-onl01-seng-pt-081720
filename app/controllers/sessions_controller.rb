class SessionsController < ApplicationController
  def new
  end

  def create
    # byebug
    return redirect_to(controller: 'sessions',
          action: 'new') if !params[:name] || params[:name].empty?
    session[:name] = params[:name] #nil sets session[:name] if :name was given
    redirect_to controller: 'application', action: 'hello' #redirects to "/" if logged in

  end

  def destroy
    session.delete :name #clears session[:name] if it was set
    redirect_to controller: 'application', action: 'hello'
  end
end
