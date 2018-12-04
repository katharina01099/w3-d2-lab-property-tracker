require('pg')

class PropertyTrack

  attr_accessor :adress, :value, :no_bedrooms, :year, :square_footage, :build
  attr_reader :id

    def initialize(options)
      @id = options['id'].to_i if options['id']
      @adress = options['adress']
      @value = options['value'].to_i
      @no_bedrooms = options['no_bedrooms'].to_i
      @year = options['year'].to_i
      @square_footage = options['square_footage'].to_i
      @build = options['build']
    end


    def save()
      db = PG. connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "INSERT INTO property_trackers
      (
        adress,
        value,
        no_bedrooms,
        year,
        square_footage,
        build
      )
      VALUES
      ($1, $2, $3, $4, $5, $6)
      RETURNING *
      "
      values = [@adress, @value, @no_bedrooms, @year, @square_footage, @build]
      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]['id'].to_i
      db.close()
    end

    def update()
      db = PG. connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "UPDATE property_trackers
      SET
      (
        adress,
        value,
        no_bedrooms,
        year,
        square_footage,
        build
      ) =
      ($1, $2, $3, $4, $5, $6)
      WHERE id = $7
      "
      values = [@adress, @value, @no_bedrooms, @year, @square_footage, @build, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
    end

    def delete()
      db = PG. connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "DELETE FROM property_trackers
      WHERE id = $1
      "
      values = [@id]
      db.prepare("delete", sql)
      db.exec_prepared("delete", values)
      db.close()
    end

    def PropertyTrack.delete_all()
      db = PG. connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "DELETE FROM property_trackers
      "
      db.prepare("delete_all", sql)
      db.exec_prepared("delete_all")
      db.close()
    end

    def PropertyTrack.find(id)
      db = PG. connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "SELECT * FROM property_trackers
      WHERE id = $1
      "
      values = [id]
      db.prepare("find", sql)
      properties = db.exec_prepared("find", values)
      db.close()
      return properties.map {|property| PropertyTrack.new(property)}

    end





end
