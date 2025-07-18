class CreateSearchItems < ActiveRecord::Migration[7.1]
  def change
    create_table :search_items do |t|
      t.string :user_ip
      t.string :query

      t.timestamps
    end
  end
end
