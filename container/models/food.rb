class Food

  attr_accessor :id, :title, :body, :image

  def save
    conn = Food.open_connection
    if(!self.id)
      sql = "INSERT INTO food (title, body, image) VALUES ('#{self.title}', '#{self.body}', '#{self.image}')"
    else
      sql = "UPDATE food SET title='#{self.title}', body='#{self.body}', image='#{self.image}', WHERE id = #{self.id}"
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
    #this is where it broke
    sql = "SELECT id,title,body,image FROM food ORDER BY id"
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
    food.image = food_data['image']
    food
  end

end
