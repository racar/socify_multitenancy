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

index do
    selectable_column
    id_column
    column :name
    column :email

    column "" do |a|
          links = ''.html_safe
          links += link_to(t("View"), admin_user_path(a.id),:class => "member_link view_link")
          links += link_to(t("Edit"), user_edit_admin_users_path(a.id),:class => "member_link edit_link")
          links += link_to(t("Delete"), admin_user_path(a.id), :method => :delete, :confirm => I18n.t('active_admin.delete_confirmation'),:class => "member_link delete_link")
          links
        end

end


sidebar :carga_batch, partial: 'carga_batch', only: :index # app/views/admin/user/_carga_batch.html.erb



filter :name
filter :email

#############################
form :html => { :multipart=>true } do |f|
  	f.inputs 'Nuevo Usuario'  do
        f.input :name
    		f.input :email
        f.input :cargo
    		
  	end

  	f.actions
	end

############################ collection action
collection_action :user_edit , :method => :get do
    @user = User.find(params[:format])
    render "admin/users/user_edit"
  end

  collection_action :user_update, :method => :post do
    @user = User.find(params[:format])
    if params[:user][:password].blank?
     @user.update_without_password(params[:user])
    else
     @user.update_attributes(params[:user])
    end
    if @user.errors.blank?
     redirect_to admin_users_path, :notice => "Usuario actializado satisfactoriamente."
    else
     render :user_edit
    end
  end
#################

controller do

    def new
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @user }

      end
    end

    def upload

      uploaded_io = params[:users_file]

        File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end

        require 'spreadsheet'


            book = Spreadsheet.open Rails.root.join('public', 'uploads', uploaded_io.original_filename)
            sheet1 = book.worksheet 0


            sheet1.each 1 do |row|
              unless row[0].blank?

              generated_password = Devise.friendly_token.first(8)

              @user = User.new(:email => row[1], :name => row[0],
                 :password => generated_password,
                 :password_confirmation => generated_password)

              @user.save
              end
            end

respond_to do |format|
          format.html { redirect_to admin_users_path, notice: 'Usuarios cargados desde archivo con éxito.' }
end


    end

    def create

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
