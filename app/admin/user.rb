ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :name,:email,:encrypted_password,:about,:avatar,:cover,:reset_password_token,:reset_password_sent_at,
:remember_created_at,:sign_in_count,:current_sign_in_at,:last_sign_in_at,:current_sign_in_ip,
  :last_sign_in_ip,:confirmation_token,:confirmed_at,:confirmation_sent_at,:created_at,
  :updated_at,:sex,:location,:dob,:phone_number,:posts_count,:slug,:points,:subdomain
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

controller do

    def new
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }
      end
    end

    def create
      byebug
      @user = User.new(user_params)
      respond_to do |format|
        generated_password = Devise.friendly_token.first(8)
        @user.password = generated_password

        if @user.save
          NotifyMailer.new_user_account(@user,generated_password).deliver
          format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    def user_params
      params.require(:user).permit(:subdomain,:name, :email, :password, :password_salt, :logo, profile_attributes: [:identification,:cod_cost_centre,:name_cost_centre,:leader,:job_title])
    end

  end

end
