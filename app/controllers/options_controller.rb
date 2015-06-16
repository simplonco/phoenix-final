class OptionsController < ApplicationController
  def index
  end

  def create

    if params["img_header"] != nil
      filename = params["img_header"].original_filename 
      new_path = Rails.root + "app/assets/images/" + filename
      FileUtils.mv(params["img_header"].tempfile.path, new_path)
      params["img_header"] = filename
    end

    %w[title_header text_footer link_twitter link_linkedin link_youtube id_analytics img_header bg_header color_header bg_footer color_footer mode_maintenance].each do |key|
      option = Option.where(option_key: key).first_or_initialize
      option.option_value = params[key] if params["img_header"] != filename ? params["img_header"] == filename : params[key]
      option.save if params[key].blank? != true
    end

    redirect_to admin_options_path
  end
end
