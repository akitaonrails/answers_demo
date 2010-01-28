class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  # Deals with user creation. This is just an example that plays around will all possible scenarios.
  # In your application, you don't need to contain all those scenarios, just the ones that fit your app.
  #
  # If the user needs to confirm his account, we have to tell him that we sent a confirmation e-mail,
  # otherwise we just show a welcome information. Besides, in some cases the user has a trial period
  # to use the application, in such cases, confirm_within is higher than zero and the user can be
  # signed in just after sign up.
  #
  def create
    @user = User.new(params[:user])

    if @user.save
      Product.all.each do |product|
        @user.memberships.create :product => product
      end
      if @user.respond_to?(:confirm!)
        flash[:notice] = t('devise.confirmations.send_instructions')
        sign_in_and_redirect @user if @user.class.confirm_within > 0
      else
        flash[:notice] = t('flash.users.create.notice', :default => 'User was successfully created.')
        redirect_to root_path
      end
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    # Could be splitted in two actions
    method = params[:user][:password] ? :update_with_password : :update_attributes
    if @user.send(method, params[:user])
      flash[:notice] = 'Updated successfully'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    sign_out current_user
    flash[:notice] = t('flash.users.destroy.notice', :default => 'User was successfully destroyed.')
    redirect_to root_path
  end
end
