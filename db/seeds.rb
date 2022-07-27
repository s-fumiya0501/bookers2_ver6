20.times do |n|
  start_start_day = Date.new(2022, 7, 25)
  start_end_day = Date.new(2022, 7, 16)
  Book.create(
    user_id: 2,
    title: "test#{n}",
    body: "test_place#{n}",
    created_at: (rand*10).days.ago
  )
end