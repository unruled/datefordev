ActiveAdmin.register UserCourse do
permit_params :user_id, :course_id, :passed_levels, :is_completed

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
    column :user_id
    column :course_id
    column :passed_levels
    column :is_completed
    column :created_at, :sortable => :created_at do |obj|
      obj.created_at.localtime.strftime("%B %d, %Y %H:%M")
    end
    actions
  end
  
  filter :user_id
  filter :course_id
  filter :is_completed 
  filter :created_at 

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :course_id, as: :select, collection: Course.all.map{ |course| [course.title, course.id] }
      f.input :passed_levels
      f.input :is_completed, as: :radio
      
    end
    f.actions
  end

end
