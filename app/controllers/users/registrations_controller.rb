class Users::RegistrationsController < Devise::RegistrationsController  # Override the action you want here.

  # POST /resource
  #def create
  #  if verify_recaptcha
  #    super
  #  else
  #    build_resource(sign_up_params)
  #    clean_up_passwords(resource)
  #    flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
  #    flash.delete :recaptcha_error
  #    render :new
  #  end
  #end


  #def create
  #  if request.post?
  #    if captcha_valid? params[:captcha]
  #      redirect_to :root, :notice => "valid captcha"
  #      super
  #    else
  #      flash[:alert] = "invalid captcha"
  #    end
  #  end
  #end
  #def create
  #  @user = User.new(sign_up_params)
  #  if @user.valid_with_captcha?
  #    flash[:alert] = "valid"
  #  else
  #    flash[:alert] = "عبارت وارد شده درست نیست."
  #  end
  #  @user = User.new(sign_up_params)
  #  if @user.valid_with_captcha?
  #    super
  #  else
  #    build_resource(sign_up_params)
  #    clean_up_passwords(resource)
  #
  #    #flash[:alert] = "عبارت وارد شده درست نیست."
  #    render :new
  #  end
  #end
  #
  # def create
  #   session["#{resource_name}_return_to"] = complete_path
  #   super
  # end
  private


end