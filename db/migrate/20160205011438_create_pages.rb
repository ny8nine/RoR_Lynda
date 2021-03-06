class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
    	t.string "name"
    	t.string "permalink"
    	t.integer "position"
    	t.boolean "visible", :default => false
    	t.integer "subject_id"
      t.timestamps null: false
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def down
  	remove_index("pages", "permalink")
  	remove_index("pages", "subject_id")
  	drop_table :pages
  end
end
