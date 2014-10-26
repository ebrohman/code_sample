namespace :seed do
  desc 'Generate team data'
  task :teams => :environment do
    file = File.read("#{Rails.root}/lib/data/teams.json")
    teams = JSON.parse(file)

    teams.each do |team|
      Team.create!({
        name: team['name'],
        logo: team['logo'],
        website: team['website'],
        founding_year: team['foundedYear'],
        home_stadium: team['homeStadium'],
        stadium_capacity: team['stadiumCapacity'],
        uuid: team['id']
      })
    end

    puts "...#{Team.count} imported"
  end

  desc 'Generate player data'
  task :players => :environment do
    file = File.read("#{Rails.root}/lib/data/players.json")
    players = JSON.parse(file)

    players.each do |player|
      Player.create!({
        first_name: player['firstName'],
        last_name: player['lastName'],
        nickname: player['nickname'],
        nationality: player['nationality'],
        age: player['age'],
        birth_day: player['birthDate'],
        birth_country: player['birthCountry'],
        birth_city: player['birthCity'],
        position: player['position'],
        foot: player['foot'],
        image: player['image'],
        height_cm: player['heightCm'],
        weight_kg: player['weightKg'],
        uuid: player['id'],
        team_uuid: player['teamId'],
        team_id: Team.find_by_uuid(player['teamId']).id
      })
    end

    puts "...#{Player.count} imported"
  end

  desc 'Generate game performance data'
  task :performances => :environment do
    player_id = Player.find_by_uuid('8CD7F0AB-6F0F-4ECC-8F5C-CDEF8C11B261').id
    100.times do
      GamePerformance.create!({
        aerial_duels_won: rand(5),
        assists: rand(15),
        goals: rand(4),
        pass_success_percentage: ((rand(100)+1) / (rand(100)+1)) * (10.10 / 10),
        player_id: player_id,
        red_cards: rand(99),
        shots_per_game: rand(9000),
        yellow_cards: rand(77),
        match_date: Time.now + rand(200).days
      })

      puts "...#{GamePerformance.count} created"
    end
  end
end