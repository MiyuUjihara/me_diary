class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :title
      t.string :caption
      t.date :date,       null: false
      t.string :image
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
