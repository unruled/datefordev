ActiveAdmin.register Job do
permit_params :user_id, :title, :description, :avatar, :is_published, :is_approved, :technology_list, :country, :city


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  collection_action :autocomplete_tag_name, :method => :get

  controller do
    autocomplete :tag, :name, :full => true, :display_value => :funky_method
  end

  index do
    selectable_column
    column :user
    column :title
    column :is_published
    column :is_approved
    column :created_at, :sortable => :created_at do |obj|
      obj.created_at.localtime.strftime("%B %d, %Y %H:%M")
    end
    actions
  end
  
  filter :user
  filter :title
  filter :is_published
  filter :is_approved
  filter :created_at 

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :description, as: :ckeditor
      f.input :city
      f.input :country
      f.input :is_published, as: :radio
      f.input :is_approved, as: :radio
      f.input :avatar, as: :file, :hint => image_tag(f.object.avatar.url)
      f.input :technology_list, :as => :autocomplete, :url => autocomplete_tag_name_admin_jobs_path, input_html: { :multiple => true, 'data-delimiter' => ',', :name => "job[technology_list]"}
    end
    f.actions
  end

end
