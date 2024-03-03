namespace :populate_data do
  desc "Populates database with recipes and ingredients"
  task run: :environment do
    puts "Enter file path:"
    file_path = STDIN.gets.strip

    PopulateData.new(file_path:).call
  end
end
