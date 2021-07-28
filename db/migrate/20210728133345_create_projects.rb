class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.text :description
      t.string :image
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
