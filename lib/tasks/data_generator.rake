namespace :data_generator do
  desc 'Generate potato shares'
  task generate: :environment do
    generator = Share::DataGenerator.new
    # generator = Share::DataGenerator.new(2022,11,8) #yesterday
    generator.generate if generator.valid?
  end
end
