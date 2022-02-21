class CreateUserTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_todos do |t|
      t.references  :user, foreign_key: true, null: false,  comment: "ユーザーID"
      t.references  :todo, foreign_key: true, null: false,  comment: "TodoID"
      t.integer :status,   default: 0,        null: false,  comment: "ステータス"
      t.timestamps
    end
  end
end
