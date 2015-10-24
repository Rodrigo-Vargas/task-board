class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :title
      t.belongs_to :user, index: true
      t.belongs_to :list, index: true

      t.timestamps null: false
    end
  end
end
