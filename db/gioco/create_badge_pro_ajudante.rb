type = Type.find_or_create_by_name('ajudante')
badge = Badge.create({ 
                      :name => 'pro', 
                      :points => '500',
                      :type_id  => type.id,
                      :default => 'false'
                    })
puts '> Badge successfully created'