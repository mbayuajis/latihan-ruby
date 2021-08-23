module Controller
  class Articles < Grape::API
    namespace 'articles' do
      desc 'Get articles.'
      get do
        Article.all
      end
  
      desc 'Create article.'
      params do
        requires :title, type: String, desc: 'Title'
        requires :body, type: String, desc: 'Body'
      end
      post do
        article = Article.new(title: params[:title], body: params[:body])
        article.save
      end
  
      desc 'Find article.'
      params do
        requires :id, type: Integer, desc: 'Article ID.'
      end
      route_param :id do
        get do
          Article.find(params[:id])
        end
      end
  
      desc 'Delete article.'
      params do
        requires :id, type: Integer, desc: 'Article ID'
      end
      route_param :id do
        delete do
          Article.find(params[:id]).destroy
        end
      end
  
      desc 'Update article.'
      params do
        requires :id, type: Integer, desc: 'Article ID'
      end
      route_param :id do
        put do
          Article.find(params[:id]).update({
            title: params['title'],
            body: params['body']
          })
        end
      end
    end
  end
end