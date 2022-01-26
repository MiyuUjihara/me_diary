class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title,  null: false
      t.text :content,  null: false
      t.string :image, null: false
      t.references :admin_user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
