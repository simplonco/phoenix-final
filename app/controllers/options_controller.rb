class OptionsController < ApplicationController
  def index
  end

  def create

    if params["img_header"] != nil
      filename = params["img_header"].original_filename 
      new_path = Rails.root + "public/images/" + filename
      Dir.mkdir(Rails.root.join("public/images/").to_s) if File.directory?(Rails.root.join('public/images/').to_s) != true
      FileUtils.mv(params["img_header"].tempfile.path, new_path)
      params["img_header"] = filename
    end

    %w[title_header text_footer link_twitter link_facebook link_linkedin link_google_plus id_analytics img_header bg_header color_header bg_footer color_footer mode_maintenance].each do |key|
      option = Option.where(option_key: key).first_or_initialize
      option.option_value = params[key] if params["img_header"] != filename ? params["img_header"] == filename : params[key]  
      option.save
    end

    redirect_to admin_options_path
  end
end
