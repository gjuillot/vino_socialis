class UsersController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /users
  def index
  end
  
  # GET /users/1
  def show
  end
  
  # GET /users/1/edit
  def edit
  end
  
  # PUT /users/1
  def update
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end
  
  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end
end
