ActiveAdmin.register SkillQuestion do

  permit_params :skill_id, :question, :answer, :language_id

  index do
    column :language
    column :skill
    column :question
    column :answer
    actions
  end  
  
  form do |f|
    f.inputs do
      f.input :skill_id, as: :select, collection: Skill.all.map{ |skill| [skill.name, skill.id] }
      f.input :language_id, as: :select, collection: Language.all.map{ |language| [language.name, language.id] }
      f.input :question, as: :ckeditor
      f.input :answer
    end
    f.actions
  end  

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


end
