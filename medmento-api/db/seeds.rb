# a = User.create(first_name: "Kevin", last_name: "Chen", email: "yolo@yolo.com")

[:seconds, :minutes, :hour, :day, :week, :month].each do |period|
  FrequencyPeriod.create(name: period)
end


ClockworkEvent.create(
      patient_name: "Grandma",
      drug_name: "Claritin",
      message: "I hope your allergies are better",
      patient_number: "7031112222",
      frequency_quantity: 1,
      frequency_period_id: 5,
      at: "Monday 1:00"
  )

f = 0
10.times do
  PainRating.create(rating: f, clockwork_event_id: 1)
  f = 0 if f == 5
  f += 1
end

ClockworkEvent.create(
      patient_name: "Mom",
      drug_name: "Advil",
      message: "I wish your headaches go away",
      patient_number: "7034449999",
      frequency_quantity: 1,
      frequency_period_id: 5,
      at: "Monday 1:00"
  )

f = 5
10.times do
  PainRating.create(rating: f, clockwork_event_id: 2)
  f = 5 if f == 0
  f -= 1
end

ClockworkEvent.create(
      patient_name: "Dad",
      drug_name: "Nyquil",
      message: "I wish you sleep well",
      patient_number: "7038889999",
      frequency_quantity: 1,
      frequency_period_id: 5,
      at: "Monday 1:00"
  )

f = 10
10.times do
  PainRating.create(rating: f, clockwork_event_id: 3)
  f = 5 if f == 3
  f -= 1
end

PainRating.create(rating: 0, clockwork_event_id: 4)
PainRating.create(rating: 0, clockwork_event_id: 4)
PainRating.create(rating: 0, clockwork_event_id: 4)
PainRating.create(rating: 3, clockwork_event_id: 4)
PainRating.create(rating: 6, clockwork_event_id: 4)
PainRating.create(rating: 2, clockwork_event_id: 4)
PainRating.create(rating: 0, clockwork_event_id: 4)
PainRating.create(rating: 0, clockwork_event_id: 4)
PainRating.create(rating: 3, clockwork_event_id: 4)

PainRating.where(clockwork_event_id: 4).each_with_index do |pain_rating, index|
    pain_rating.update(updated_at: "#{DateTime.now - 10 + index}")
end