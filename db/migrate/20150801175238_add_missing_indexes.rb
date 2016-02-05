class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :profile_accesses, :from
    add_index :profile_accesses, :to
    add_index :messages, :sender_id
    add_index :messages, :recipient_id
    add_index :invites, :user_id
    add_index :traits, :language_id
    add_index :user_courses, :course_id
    add_index :user_courses, :user_id
    add_index :user_courses, [:course_id, :user_id]
    add_index :user_details, :user_id
    add_index :users, :girl_match_skill_id
    add_index :users, :referred_user_id
    add_index :courses, :instructor_id
    add_index :courses, :language_id
    add_index :skill_questions, :skill_id
    add_index :skill_questions, :language_id
    add_index :advertises, :skill_id
    add_index :advertises, :language_id
    add_index :course_levels, :course_id
    add_index :tips, :language_id
    add_index :profile_views, :from
    add_index :profile_views, :to
    add_index :skills, :language_id
  end
end