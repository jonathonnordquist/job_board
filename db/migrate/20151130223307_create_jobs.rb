class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string 'title'
      t.string 'company'
      t.string 'description'
      t.string 'category'

      t.timestamps null: false
    end
  end
end
