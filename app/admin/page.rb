ActiveAdmin.register Page do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :list, :of, :attributes, :on, :model, :position, :name, :slug, :title, :subtitle, :body, :color, :text_align, :block_color, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

sortable

index :as => :sortable do
    label :title
    actions
  end

index do
    selectable_column
    id_column
    column :position
    column :name
    column :slug
    column :title
    column :subtitle
    column :body
    column :color
    column :text_align
    column :block_color
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
      f.input :position
      f.input :name
      f.input :title
      f.input :subtitle
      f.input :body
      f.input :color, input_html: { class: "colorpicker" }
      f.input :text_align, :as => :radio, :collection => ["left", "center", "right"]
      f.input :block_color, :as => :radio, :collection => ["bg_white", "bg_black"]
      f.file_field :image
    end
    f.actions
  end

config.clear_sidebar_sections!

end
