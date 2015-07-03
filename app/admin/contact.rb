ActiveAdmin.register Contact do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :first_name, :last_name, :mail, :object, :message
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :mail
    column :object
    column :message
    actions
  end

config.clear_sidebar_sections!

end
