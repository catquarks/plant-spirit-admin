# making plants
20.times do
	Plant.create(name: "#{Faker::Color.color_name} #{Faker::Music.instrument.downcase} plant")
end

# making future feelings from cat names
20.times do
	Feeling.create(name: "like #{Faker::Cat.name} the #{Faker::Hacker.adjective} kitty")
end

# adding future feelings to plants
plants = Plant.all
plants.each do |plant|
	plant.future_feelings << Feeling.all.sample(2)
	plant.save
end

# making current feelings from celestial things
# and adding them to plants
plants.each do |plant|
	plant.current_feelings << Feeling.create(name: "like #{Faker::Space.nasa_space_craft} crashed into #{Faker::Space.planet}")
	plant.current_feelings << Feeling.create(name: "like #{Faker::Space.nasa_space_craft} crashed into #{Faker::Space.moon}")
	plant.save
end


# adding just one real example
l = Plant.create(name: 'Lavender', summary: 'A lovely plant to frolic with.')
c = Feeling.create(name: 'Contentment', summary: 'feeling okay with things')
i = Feeling.create(name: 'Insomnia', summary: 'inability to sleep')

l.future_feelings << c
l.current_feelings << i
l.save
