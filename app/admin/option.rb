ActiveAdmin.register Option do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :option_key, :option_value
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
    column I18n.t('activerecord.models.attributes.option.option_key'), :option_key
    column I18n.t('activerecord.models.attributes.option.option_value'), :option_value
    column I18n.t('activerecord.models.attributes.option.created_at'), :created_at
    column I18n.t('activerecord.models.attributes.option.updated_at'), :updated_at
    actions
  end

form do |f|
    f.inputs "Googleanalytic Details" do
      f.input :option_key, label: I18n.t('option_key'), placeholder: "Entrer googleanalytic ou modemaintenance"
      f.input :option_value, label: I18n.t('option_value'), placeholder: "Entrer un UA ID pour googleanalytic soit la valeur 0 (off) ou 1 (on) pour modemaintenance"
    end
    f.actions
  end  

config.clear_sidebar_sections!

end
