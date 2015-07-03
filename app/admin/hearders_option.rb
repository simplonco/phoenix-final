ActiveAdmin.register_page "Headers Option" do
  menu priority: 3, label: proc{ I18n.t("active_admin.headers_option") }
  
  content title: proc{ I18n.t("active_admin.headers_option") }do
    render partial: 'headers_option'
  end
end