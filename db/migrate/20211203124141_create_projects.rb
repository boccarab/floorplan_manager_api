class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :uuid, null: false

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps

      t.index [:uuid]
    end
  end
end
