ActiveAdmin.register Page do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :position, :name, :slug, :title, :subtitle, :body, :color, :text_align, :block_color, :image, :contact, :title_map, :adress_map, :video
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
    column :position
    column I18n.t('activerecord.models.attributes.page.name'), :name
    column I18n.t('activerecord.models.attributes.page.slug'), :slug
    column I18n.t('activerecord.models.attributes.page.title'), :title
    column I18n.t('activerecord.models.attributes.page.subtitle'), :subtitle
    column I18n.t('activerecord.models.attributes.page.body'), :body
    column I18n.t('activerecord.models.attributes.page.color'), :color
    column I18n.t('activerecord.models.attributes.page.text_align'), :text_align
    column I18n.t('activerecord.models.attributes.page.block_color'), :block_color
    actions
  end

sortable

index :as => :sortable do
    label :title
    actions
  end

controller do
    def create

      @page = Page.new(permitted_params[:page])

      if @page.save
      	redirect_to @page
      else
      	render "new"
      end
    end
  end

form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Page Details" do
      f.input :position, label: I18n.t('position'), placeholder: "Entrer une position a partir du nombre 0"
      f.input :name, label: I18n.t('name'), placeholder: "Entrer un nom"
      f.input :title, label: I18n.t('title'), placeholder: "Entrer un titre"
      f.input :subtitle, label: I18n.t('subtitle'), placeholder: "Entrer un sous-titre"
      f.input :body, label: I18n.t('body'), placeholder: "Entrer votre texte"
      f.input :color, input_html: { class: "colorpicker" }, label: I18n.t('color')
      f.input :text_align, :as => :radio, :collection => ["left", "center", "right"], label: I18n.t('text_align')
      f.input :block_color, :as => :radio, :collection => ["bg_white", "bg_black"], label: I18n.t('block_color')
      f.input :image, :as => :file, label: I18n.t('image')
      f.input :contact, :as => :radio, :collection => ["slide", "formulaire de contact", "map", "video"]
      f.input :title_map, label: I18n.t('title_map'), placeholder: "Entrer un titre pour la map"
      f.input :adress_map, label: I18n.t('adress_map'), placeholder: "Entrer une adresse pour la map"
      f.input :video, placeholder: "Entrer une adresse pour la video"
    end
    f.actions
  end

config.clear_sidebar_sections!

end
