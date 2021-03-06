class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by( email: params[ :user ][ :email ] )
    if user && user.authenticate( params[ :user ][ :password ] )
      session[ :user_id ] = user.id
      if user.organizer
        redirect_to dashboard_path
      else
        redirect_to root_path
      end
    else
      @error = 'You have entered either an invalid email or password. Please try again!'
      render template: '/sessions/new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
