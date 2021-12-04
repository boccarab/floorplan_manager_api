class CreateFloorplans < ActiveRecord::Migration[6.1]
  def change
    create_table :floorplans do |t|
      t.string :name
      t.string :uuid, null: false

      t.belongs_to :project, null: false, foreign_key: true
      t.string :plan_image

      t.timestamps

      t.index [:uuid]
    end
  end
end
