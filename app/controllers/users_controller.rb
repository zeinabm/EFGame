class UsersController < ApplicationController
  def index

  end

  def show
  end

  def edit
  end

  def destroy
  end
  
  
  def ranking
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :birth_year, :birth_month, :birth_day)
  end
end
