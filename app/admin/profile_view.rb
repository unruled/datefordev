ActiveAdmin.register ProfileView do
permit_params :from, :to, :last_view, :view_count, :is_read

  index do
    selectable_column
    column :from
    column :to
    column :last_view, :sortable => :last_view do |obj|
      obj.last_view.localtime.strftime("%B %d, %Y %H:%M")
    end    
    column :view_count
    column :is_read
    actions
  end
  
  filter :from
  filter :to
  filter :last_view
  filter :view_count
  filter :is_read

  form do |f|
    f.inputs do
      f.input :from, as: :select, collection: User.all.map{ |user| [user.name, user.id] }
      f.input :to, as: :select, collection: User.all.map{ |user| [user.name, user.id] }
      f.input :last_view
      f.input :view_count
      f.input :is_read, as: :radio

    end
    f.actions
  end

end
