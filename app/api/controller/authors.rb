module Controller
  class Authors < Grape::API
    namespace 'authors' do
      desc 'Get authors'
      get do
        # Author.all
        ActiveRecord::Base.connected_to( database: { reading: :primary } ) do
          # all code in this block will be connected to the reading role
          @authors = Author.all
          @authorlist = @authors.map do |a|
            { :id => a.id, :name => a.name, :articles => Article.where(author_id: a.id) }
          end

          json = { :authors => @authorlist }
        end        
      end
    end
  end
end