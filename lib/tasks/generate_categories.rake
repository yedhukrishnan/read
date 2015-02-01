namespace :generate_categories do

  desc "Create a basic list of categories"
  task :categories do
    category_list = %w{Technology Science Nature Literature}
    category_list.each do |category|
      Category.create({ name: category })
    end
  end
  
end
