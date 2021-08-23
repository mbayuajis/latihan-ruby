class Api < Grape::API
  format :json
  prefix 'api'
  version 'v1', :path

  mount Controller::Authors
  mount Controller::Articles
end