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

end
