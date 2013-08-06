class SessionsController < ApplicationController
  def new
    authorize! :read, :session
  end
  
  def create
    authorize! :create, :session
    salt = "d40b3f20aca34409c09f24dd0a2a490801ac0ef310043ec8b25c6c9a842bbd054cc49da232d3819b"
    if Digest::SHA1.hexdigest(params[:session][:password] + salt) == "4aa8f78474226138a9427ccf9f1a05a2a146cd04"
      session[:admin] = true
      redirect_to session.delete(:return_to) || root_url, :notice => "Welcome in, beautiful person!"
    else
      flash.now[:alert] = "Nope, keep tryin'."
      render "new"
    end
  end
  
  def destroy
    authorize! :destroy, :session
    session[:admin] = nil
    redirect_to root_url, :notice => "Bye bye, beautiful person! See you soon."
  end
end
