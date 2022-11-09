namespace :data_generator do
  desc 'Generate potato shares'
  task generate: :environment do
    generator = DataGenerator.new
    # generator = DataGenerator.new(2022,11,8) #yesterday
    generator.generate if generator.valid?
  end
end
