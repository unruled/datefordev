ActiveAdmin.register CourseLevel do
permit_params :course_id, :title, :description, :question, :answer, :predefined_answer, :case_sensitive, :regular_expression, :error_message, :congratulations

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

  index do
    selectable_column
    column :course
    column :title
    column :created_at, :sortable => :created_at do |obj|
      obj.created_at.localtime.strftime("%B %d, %Y %H:%M")
    end
    actions
  end
  
  filter :course
  filter :title
  filter :created_at 

  form do |f|
    f.inputs do
      f.input :course
      f.input :title
      f.input :description, as: :ckeditor
      f.input :question, as: :ckeditor
      f.input :answer
      f.input :regular_expression, as: :radio
      f.input :case_sensitive, as: :radio
      f.input :predefined_answer
      f.input :error_message, as: :ckeditor
      f.input :congratulations, as: :ckeditor
      
    end
    f.actions
  end

end
