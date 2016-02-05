class CreateReportAbuses < ActiveRecord::Migration
  def change
    create_table :report_abuses do |t|
      t.integer :from
      t.integer :to
      t.text :body
      t.timestamps
    end
  end
end
