class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
      if @user = login(params[:email],params[:password])
         redirect_back_or_to(projects_path, :notice => 'Login successful.') 
      else
        flash.now[:alert] = "Login failed. Invalid params" 
        render :action => "new" 
      end
  end
    
  def destroy
    logout
    redirect_to(root_path, :notice => 'Bye!')
  end
end
