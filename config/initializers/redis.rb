
# REDIS = Redis.new(:driver => :hiredis)
REDIS = Redis.new(url: ENV["REDIS_URL"])
