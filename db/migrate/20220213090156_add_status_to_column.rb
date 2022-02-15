class AddStatusToColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :columns, :status, :integer, null: false, default: 0, comment: "ステータス"
  end
end
