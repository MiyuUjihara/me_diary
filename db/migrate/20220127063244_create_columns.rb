class CreateColumns < ActiveRecord::Migration[6.0]
  def change
    create_table :columns do |t|
      t.string :title,  null: false
      t.text :content
      t.string :image, null: false
      t.references :admin_user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
