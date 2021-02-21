class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.string :require
      t.string :welfare
      t.string :salary
      t.boolean :is_available
      t.integer :company_id

      t.timestamps
    end
  end
end
