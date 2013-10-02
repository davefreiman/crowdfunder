class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    respond_to do |format|
      if @user = login(params[:email],params[:password])
        format.html { redirect_back_or_to(projects_path, :notice => 'Login successful.') }
      else
        format.html { flash.now[:alert] = "Login failed. Shit's Invalid"; render :action => "new" }
      end
    end
  end
    

  def show
  end
    
  def destroy
    logout
    redirect_to(root_path, :notice => 'Bye!')
  end
end
