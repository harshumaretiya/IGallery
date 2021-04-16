ActiveAdmin.register Photo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :photo_name, :photo_title, :album_id, :image_file_name, :image_content_type, :image_file_size, :image_updated_at,tags_attributes: [:id, :_destroy, :photo_id, :name]
  #
  # or
  #
  # permit_params do
  #   permitted = [:photo_name, :photo_title, :album_id, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :imagefile_file_name, :imagefile_content_type, :imagefile_file_size, :imagefile_updated_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    column "Photo ID", :id
    column :photo_name
    column :photo_title
    column "Album ID", :album_id
    actions
  end
  filter :album_id, label: "Album ID"
  filter :photo_name, label: "Photo Name"
  filter :photo_title, label: "Photo Title"
end
