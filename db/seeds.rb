tags = [
  "bird",
  "boy",
  "girl",
  "hope",
  "child",
  "love",
  "mother",
  "friend",
  "writer",
  "poet",
  "childhood",
  "factory",
  "sea",
  "ocean",
  "fun",
  "regret",
  "loss",
  "sad",
  "family",
  "faith",
]

tags.each do |tags_title|
  tags = Tag.create(title: tags_title)
end
