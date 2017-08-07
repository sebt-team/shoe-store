# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Shoe.exists?
  now = Time.now.to_f
  long_ago = 5.years.ago.to_f

  def rtime(now,init_time)
    x_init_time = init_time.to_time.to_f
    Time.at(rand * (now - x_init_time) + x_init_time)
  end

  def risbn
    "#{rand.to_s[2..5]}-#{rand.to_s[2..3]}-#{rand.to_s[2..6]}-#{rand(9)}"
  end

  ActiveRecord::Base.transaction do
    
    brands = Brand.create([
      { name: 'Converse' },
      { name: 'Nike'},
      { name: 'New Balance'},
      { name: 'Reebok'},
      { name: 'Puma'},
      { name: 'Vans'},
      { name: 'Etnies'},
      { name: 'Adidas'}
    ])

    Shoe.create([
      {
        model: 'All Star',
        brand: brands[0], #'Converse'
        release_year: 1921,
        sku: '25124',
        isbn: risbn,
        edition_date: (init_time = Date.parse('2015-01-01')),
        created_at: rtime(now, init_time)
      },
      {
        model: 'Air Force',
        brand: brands[1], #'Nike'
        release_year: 1982,
        sku: '82909',
        isbn: risbn,
        edition_date: (init_time = Date.parse('2016-01-01')),
        created_at: rtime(now, init_time)
      },
      {
        model: '574',
        brand: brands[2], #New Balance'
        release_year: 1988,
        sku: '51936',
        isbn: risbn,
        edition_date: (init_time = Date.parse('2015-01-01')),
        created_at: rtime(now, init_time)
      },
      {
        model: 'Classic',
        brand: brands[2], #'Reebok'
        release_year: 1983,
        sku: '71150',
        isbn: risbn,
        edition_date: (init_time = Date.parse('2016-06-01')),
        created_at: rtime(now, init_time)
      },
      {
        model: 'Clyde',
        brand: brands[4], #'Puma'
        release_year: 1972,
        sku: '25434',
        isbn: risbn,
        edition_date: (init_time = Date.parse('2017-01-01')),
        created_at: rtime(now, init_time)
      },
      {
        model: 'Off The Wall',
        brand: brands[5], #'Vans'
        release_year: 1976,
        sku: '67235',
        isbn: risbn,
        edition_date: (init_time = Date.parse('2017-01-01')),
        created_at: rtime(now, init_time)
      },
      {
        model: 'Fader',
        brand: brands[6], #'Etnies'
        release_year: 1992,
        sku: '21224',
        isbn: risbn,
        edition_date: (init_time = Date.parse('2016-06-01')),
        created_at: rtime(now, init_time)
      },
      {
        model: 'Superstar',
        brand: brands[7], #'Adidas'
        release_year: 1969,
        sku: '13380',
        isbn: risbn,
        edition_date: (init_time = Date.parse('2017-01-01')),
        created_at: rtime(now, init_time)
      }
    ])
  end
end
