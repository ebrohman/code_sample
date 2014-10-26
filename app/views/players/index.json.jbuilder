json.array! @players do |p|
  json.id p.id
  json.uuid p.uuid
  json.created_at p.created_at
  json.updated_at p.updated_at
  json.bio do |json|
    json.first_name p.first_name
    json.last_name p.last_name
    json.nickname p.nickname
    json.name p.first_name + " " + p.last_name
    json.age p.age
    json.birth_city p.birth_city
    json.birth_country p.birth_country
    json.birth_day p.birth_day
    json.nationality p.nationality
  end

  json.image p.image

  json.stats do |json|
    json.foot p.foot
    json.height_cm p.height_cm
    json.position p.position
    json.weight p.weight_kg
  end

  json.team do |json|
    json.team_id p.team_id
    json.team_uuid p.team_uuid
    json.team_name p.team_name
  end


end
