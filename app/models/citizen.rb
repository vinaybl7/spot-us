# == Schema Information
#
# Table name: users
#
#  id                        :integer(4)      not null, primary key
#  email                     :string(255)     
#  crypted_password          :string(40)      
#  salt                      :string(40)      
#  created_at                :datetime        
#  updated_at                :datetime        
#  remember_token            :string(255)     
#  remember_token_expires_at :datetime        
#  first_name                :string(255)     
#  last_name                 :string(255)     
#  type                      :string(255)     
#  photo_file_name           :string(255)     
#  photo_content_type        :string(255)     
#  photo_file_size           :integer(4)      
#  location                  :string(255)     
#  about_you                 :text            
#  website                   :string(255)     
#  address1                  :string(255)     
#  address2                  :string(255)     
#  city                      :string(255)     
#  state                     :string(255)     
#  zip                       :string(255)     
#  phone                     :string(255)     
#  country                   :string(255)     
#  notify_tips               :boolean(1)      
#  notify_pitches            :boolean(1)      
#  notify_stories            :boolean(1)      
#  notify_spotus_news        :boolean(1)      
#  fact_check_interest       :boolean(1)      not null
#  status                    :string(255)     default("active")
#  organization_name         :string(255)     
#  established_year          :string(255)     
#

class Citizen < User
  # Due to an extremly crazy bug with paper clip and aasm we must include the has_attachment_for 
  # in the child class in order for everything not to blow up. For some reason the include on aasm
  # messes up the inclusion of paperclip. .shrug not sure. other option is to have aasm in the child
  # class but figured it was better to have this duplication rather than duplicating all the state
  # stuff -- DESI
  
  has_attached_file :photo, 
                    :styles      => { :thumb => '50x50#' }, 
                    :path        => ":rails_root/public/system/profiles/" << 
                                    ":attachment/:id_partition/" <<
                                    ":basename_:style.:extension",
                    :url         => "/system/profiles/:attachment/:id_partition/" <<
                                    ":basename_:style.:extension",
                    :default_url => "/images/default_avatar.png"
end
