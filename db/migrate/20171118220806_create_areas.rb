class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :name
      t.float :grade
      t.references :parent, index: true 

      t.timestamps
    end
  end
end
