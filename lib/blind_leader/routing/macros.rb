module BlindLeader
  module Routing::Macros

    def resource route, &block
      self.post   route , &block
      self.get    route , &block
      self.get    route + "/:id", &block
      self.put    route + "/:id", &block
      self.delete route + "/:id", &block
    end

  end
end
