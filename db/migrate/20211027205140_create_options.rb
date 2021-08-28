class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :key
      t.text :value
      t.boolean :autoload

      t.timestamps
    end
  end
end
