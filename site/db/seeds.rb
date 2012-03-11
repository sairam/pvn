# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create default languages
{
  en: 'English',
  bn: 'Bengali',
  gu: 'Gujarati',
  hi: 'Hindi',
  kn: 'Kannada',
  ml: 'Malayalam',
  mr: 'Marathi',
  ne: 'Nepali',
  or: 'Oriya',
  pa: 'Punjabi',
  sa: 'Sanskrit',
  ta: 'Tamil',
  te: 'Telugu',
  ur: 'Urdu'
}.each do |slug,name|
  Language.create({slug: slug, name: name})
end

User.create(email: 'pvn@example.com',password: '123456')