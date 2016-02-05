#handle custom addons
assets_root =  Rails.root.join('app','assets','javascripts')
ckeditor_plugins_root = assets_root.join('ckeditor','plugins')
%w(openlink sourcedialog).each do |ckeditor_plugin|
    Ckeditor.assets += Dir[ckeditor_plugins_root.join(ckeditor_plugin, '**', '*.js')].map {|x| x.sub(assets_root.to_path, '').sub(/^\/+/, '')}
end    
    
Ckeditor.setup do |config|
    config.assets_languages = ['en']
    config.assets_plugins = ['image', 'smiley', 'youtube']
    config.asset_path = "/assets/ckeditor/"
end

