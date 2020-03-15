require 'pry'
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
#binding.pry
name_of_item = req.path.split("/")[2]
    if req.path.match("/items/#{name_of_item}")
      item = @@items.find{|i| i.name == name_of_item}
      if item != nil
      resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
