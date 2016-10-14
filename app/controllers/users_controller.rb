class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:products], notice: 'User created!'
    else
      render :new
    end
  end

  def login

  end

  def logout
  end

end
