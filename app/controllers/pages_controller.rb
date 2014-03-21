class PagesController < ApplicationController
    skip_before_action :authenticate_user!, :except => [:index]

  def home
    @posts = Post.all.limit(4)
  end

  def about

	@client = Twitter::REST::Client.new do |config| 
	  config.consumer_key        = ENV['TWITTER_CONSUMER_API_KEY']
	  config.consumer_secret     = ENV['TWITTER_CONSUMER_API_SECRET']
	  config.access_token 		 = '2211564960-XYf3tas90mZxKBPui7lVcFSeQVUvxJXEaGSR2WO' #ENV['TWITTER_ACCESS_TOKEN']
	  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']#'I8nJtmJnYstt9nsGmmpOuROZgNAf2i342fvqa1dbfL1Tq' # ENV['TWITTER_ACCESS_TOKEN_SECRET']
	end

	@tweet = @client.user_timeline("ltfschoen", {:count => 5, :include_rts => true})

# twitter handle variable from all users
# iterate through handle list 
# client.user_timeline iterate
# print tweet and put in array
# list only latest tweets


	# def collect_with_max_id(collection=[], max_id=nil, &block)
 #  	  response = yield(max_id)
 #      collection += response
 #      response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
 #    end

 #    def @client.get_all_tweets(user)
 #      collect_with_max_id do |max_id|
 #        options = {:count => 2, :include_rts => true}
 #        options[:max_id] = max_id unless max_id.nil?
 #        user_timeline(user, options)
 #      end
 #    end



 #    max_attempts = 3
	# num_attempts = 0
	# tweets = @client.get_all_tweets("mashable")
	# begin
	#   num_attempts += 1
	#   tweets.to_a
	# rescue Twitter::Error::TooManyRequests => error
	#   if num_attempts <= max_attempts
	#     # NOTE: Your process could go to sleep for up to 15 minutes but if you
	#     # retry any sooner, it will almost certainly fail with the same exception.
	#     sleep error.rate_limit.reset_in
	#     retry
	#   else
	#     raise
	#   end
	# end

    #@client.get_all_tweets("mashable")

  end

  def team 
  	@users = User.all
  end

end
