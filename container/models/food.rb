class Food

  attr_accessor :id, :title, :body

  def save

    conn = Food.open_connection

    if(!self.id)
      sql = "INSERT INTO food (title, body) VALUES ('#{self.title}', '#{self.body}')"
    else
      sql = "UPDATE food SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"
    end


    conn.exec(sql)

  end

  def self.destroy(id)
    conn = self.open_connection
    sql = "DELETE FROM food WHERE id = #{id}"
    conn.exec(sql)
  end



  def self.open_connection

    conn = PG.connect(dbname: "food")

  end





  def self.all

    conn = self.open_connection

    sql = "SELECT id,title,body FROM food ORDER BY id"

    results = conn.exec(sql)

    foods = results.map do |food|
      self.hydrate(food)
    end

  end

  def self.find(id)

    conn = self.open_connection

    sql = "SELECT * FROM food WHERE id =#{id} LIMIT 1"

    foods = conn.exec(sql)

    food = self.hydrate(foods[0])

    food

  end

  def self.hydrate(food_data)

    food = Food.new

    food.id = food_data['id']
    food.title = food_data['title']
    food.body = food_data['body']

    food

  end





end
