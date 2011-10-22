# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create default languages
# TODO: Allow interface addition of Languages

[ {slug: "en", name: "English"  },
  {slug: "te", name: "Telugu"   },
  {slug: "hi", name: "Hindi"    },
  {slug: "ta", name: "Tamil"    },
  {slug: "be", name: "Bengali"  },
  {slug: "ka", name: "Kannada"  },
  {slug: "ma", name: "Malayalam"}
].each do |lang|
  Lang.create(lang)
end