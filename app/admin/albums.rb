ActiveAdmin.register Album do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :id, :name, :album_title, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :album_title, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column "Album ID", :id
    column "Album Name", :name
    column :album_title
    column "User ID", :user_id
    actions
  end
  filter :name, label: "Album Name"
  filter :album_title
  filter :user_id, label: "User ID"
  filter :photo_id
end
