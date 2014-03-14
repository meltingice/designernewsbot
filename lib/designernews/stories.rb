module DesignerNews
  class Stories
    include HTTParty

    base_uri 'https://api-news.layervault.com/api/v1'
    default_params :client_id => ENV['DESIGNER_NEWS_CLIENT_ID']
    format :json

    def recent
      stories = get('/stories/recent')['stories']
      stories.map { |story| Story.new(story) }
    end

    private

    def get(path)
      self.class.get(path).parsed_response
    end
  end
end