ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
   # Member Action for login as owner
   member_action :login_as, :method => :get do
    user = User.find(params[:id])
  
    #bypass_sign_in user
    bypass_sign_in user
    binding.pry
    redirect_to root_path 
  end
  index do
    selectable_column
    column "User ID", :id
    column :email
    column :first_name
    column :last_name
    column :login_as do |user|
      link_to "#{user.first_name}", login_as_admin_user_path(user), :target => '_blank'
    end
   
    actions
  end
  filter :album_id
  filter :email
  filter :first_name
  filter :last_name
end
