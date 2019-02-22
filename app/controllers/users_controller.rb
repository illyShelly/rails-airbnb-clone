class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_user_path
      # TODO: CONFIRMATION ALERT or USER SHOW?
    else
      # if not saved render form
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end


# 1. in classic form cannot change the password
