# coding: utf-8
module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", opts = {})
      extra_data = {}
      rel = opts[:rel]
      
      html = []
      html << "<div class='social-share-button' data-title='#{h title}' data-img='#{opts[:image]}'"
      html << "data-url='#{opts[:url]}' data-desc='#{opts[:desc]}' data-popup='#{opts[:popup]}' data-via='#{opts[:via]}'>"

      SocialShareButton.config.allow_sites.each do |name|
        extra_data = opts.select { |k, _| k.to_s.start_with?('data') } if name.eql?('tumblr')
        special_data = opts.select { |k, _| k.to_s.start_with?('data-' + name) }
        
        link_content = opts

        link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")
        html << link_to("<i class='fa fa-#{name.downcase}'></i>".html_safe,"#", {:rel => ["nofollow", rel],
                                  "data-site" => name,
                                  :class => "social-share-button-#{name}",
                                  :onclick => "return SocialShareButton.share(this);",
                                  :title => h(link_title)}.merge(extra_data).merge(special_data))
      end
      html << "</div>"
      raw html.join("\n")
    end
    
    def social_share_button_png_tag(title = "", opts={})
      extra_data = {}
      rel = opts[:rel]
      
      html = []
      html << "<div class='social-share-button' data-title='#{h title}' data-img='#{opts[:image]}'"
      html << "data-url='#{opts[:url]}' data-desc='#{opts[:desc]}' data-popup='#{opts[:popup]}' data-via='#{opts[:via]}'>"

      SocialShareButton.config.allow_sites.each do |name|
        extra_data = opts.select { |k, _| k.to_s.start_with?('data') } if name.eql?('tumblr')
        special_data = opts.select { |k, _| k.to_s.start_with?('data-' + name) }
        
        link_content = opts

        link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")
        html << link_to("<span class='fa fa-#{name.downcase}' style='background-image:url(#{image_url(name.downcase + "_ffffff_64.png")};display:block;width:50px;height:50px;)'></span>".html_safe,"#", {:rel => ["nofollow", rel],
                                  "data-site" => name,
                                  :class => "social-share-button-#{name}",
                                  :onclick => "return SocialShareButton.share(this);",
                                  :title => h(link_title)}.merge(extra_data).merge(special_data))
      end
      html << "</div>"
      raw html.join("\n")
    end
  end
end
