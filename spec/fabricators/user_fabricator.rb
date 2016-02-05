Fabricator(:user) do
  username { FFaker::Internet.user_name }
  password { "12345" }
  password_confirmation { |attrs| attrs[:password] }  
  email {FFaker::Internet.email}
  about_me { FFaker::Lorem.paragraph (3)}                                                                                                                                  
  age {Random.new.rand(18..55)}                                                                                                                                                          
  country {FFaker::Address.country}   
  gender {Random.new.rand(1..2)}
  looking_for {Random.new.rand(1..2)} 
  city {FFaker::Address.city}                                                                                                                                                      
  is_girl { Random.new.rand(0..1) }                                                                                                                                                    
  skill { Skill.where(:id => Random.new.rand(1..14)).first }   
  girl_match_skill_id { Skill.where(:id => Random.new.rand(1..14)).first.id }   
  site_news { true }                                                                                                                                                 
  report_abuse { 0 }                                                                                                                                                 
  unread_message_count { }                                                                                                                                          
  profile_viewed_count { }                                                                                                                                          
  points { 0 }                                                                                                                                          
  referral_code { 0}                                                                                                                                                   
  #filter                                                                                                                                                
  battery_size { 100.0 }                                                                                                                                              
  battery_date { Time.now }                                                                                                                
  notification_profile { true }                                                                                                                                       
  #locale:                                                                                                                                                          
  profile_views { 0 }                                                                                                                                               
  referral_count  { 1}                                                                                                                                                
  #referred_user_id                                                                                                                                                 
  freeze_account { false}                                                                                                                                              
  confirmed_at { Time.now}
end