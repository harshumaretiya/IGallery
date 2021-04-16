ActiveAdmin.register Tag do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :photo_id, :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:photo_id, :name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    column "Tag ID", :id
    column "Photo ID", :photo_id
    column "Tag Content", :name
   
    actions
  end
  filter :name, label: "Tag Content"
  filter  :photo_id, label: "Photo ID"
end
