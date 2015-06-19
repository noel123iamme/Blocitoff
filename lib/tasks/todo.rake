namespace :todo do
  desc "TO DO task to automatically delete expired to-do items.  Delete items older than seven days."
  task delete_items: :environment do
  	Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

end
