namespace :db do
  task :init => :environment do
    desc 'Initialize database'

    3.times do |i|
      begin
        Rake::Task['db:migrate'].execute
        break
      rescue ActiveRecord::ConnectionNotEstablished
        puts "Database connection failed (#{i + 1})"
        sleep 1
      end
    end

    if Rails.env == 'development' # TODO: ONLY RUN ONCE!!
      Rake::Task['db:seed'].execute
    end
  end
end
