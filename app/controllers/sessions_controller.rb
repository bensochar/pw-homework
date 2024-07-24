class SessionsController < ApplicationController
  def new
  end

  def create
    client = Client.find_by(email: params[:login][:email].downcase)
    if client && client.authenticate(params[:login][:password]) 
      session[:client_id] = client.id.to_s
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    session.delete(:client_id)
    redirect_to login_path, notice: "Logged out!"
  end
end
