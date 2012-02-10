module Service
  module ClassMethods
    def get(svc, user)
      find_klass(svc).new(user["services"][svc])
    end

    # I used to know how to be more DRY about this in Ruby…
    def find_klass(svc)
      case svc
        when "flickr"
          Service::Flickr
        when "facebook"
          Service::Facebook
        else
          raise "unknown service #{svc}"
      end
    end
  end

  extend ClassMethods
end

require File.join(File.dirname(__FILE__), 'service/flickr')