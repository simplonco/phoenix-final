class OptionsController < ApplicationController
		def index
	  end

	  def create

	      @hostaddr = "127.0.0.1"
	      @port = 5432
	      @dbname = "phoenix_development" 
	      @user = "phoenix" 
	      @password = "the_phoenix" 

	      title_header_value = request.request_parameters["title_header"]
	      text_footer_value = request.request_parameters["text_footer"]
	      link_twitter_value = request.request_parameters["link_twitter"]
	      link_linkedin_value = request.request_parameters["link_linkedin"]
	      link_youtube_value = request.request_parameters["link_youtube"]
	      id_analytics_value = request.request_parameters["id_analytics"]
	      img_header_value = request.request_parameters["img_header"]
	      bg_header_value = request.request_parameters["bg_header"]
	      color_header_value = request.request_parameters["color_header"]
	      bg_footer_value = request.request_parameters["bg_footer"]
	      color_footer_value = request.request_parameters["color_footer"]

	      conn = PGconn.connect(:hostaddr=>@hostaddr, :port=>@port, :dbname=>@dbname, :user=>@user, :password=>@password)

	      if self.blank? == true

	      conn.exec("INSERT INTO options (option_key, option_value, created_at, updated_at) VALUES ('title_header', '#{title_header_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'), 
	        ('text_footer', '#{text_footer_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('link_twitter', '#{link_twitter_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('link_linkedin', '#{link_linkedin_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('link_youtube', '#{link_youtube_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('id_analytics', '#{id_analytics_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('img_header', '#{img_header_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('bg_header', '#{bg_header_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('color_header', '#{color_header_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('bg_footer', '#{bg_footer_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM'),
	        ('color_footer', '#{color_footer_value}', '2032-08-07 07:01AM', '2032-08-07 07:01AM');")

	      else

	        conn.exec("UPDATE options SET option_value = '#{title_header_value}' WHERE option_key = 'title_header'; 
	          UPDATE options SET option_value = '#{text_footer_value}' WHERE option_key = 'text_footer';
	          UPDATE options SET option_value = '#{link_twitter_value}' WHERE option_key = 'link_twitter';
	          UPDATE options SET option_value = '#{link_linkedin_value}' WHERE option_key = 'link_linkedin';
	          UPDATE options SET option_value = '#{link_youtube_value}' WHERE option_key = 'link_youtube';
	          UPDATE options SET option_value = '#{id_analytics_value}' WHERE option_key = 'id_analytics';
	          UPDATE options SET option_value = '#{img_header_value}' WHERE option_key = 'img_header';
	          UPDATE options SET option_value = '#{bg_header_value}' WHERE option_key = 'bg_header';
	          UPDATE options SET option_value = '#{color_header_value}' WHERE option_key = 'color_header';
	          UPDATE options SET option_value = '#{bg_footer_value}' WHERE option_key = 'bg_footer_value';
	          UPDATE options SET option_value = '#{color_footer_value}' WHERE option_key = 'color_footer';")
	        end


	        redirect_to admin_options_path
	    end
end
