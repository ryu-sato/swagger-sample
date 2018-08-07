# ref. https://qiita.com/kymmt90/items/439868c21abe077642fa
module Swagger::UsersApi
  extend ActiveSupport::Concern
  include Swagger::Blocks
  
  included do

    swagger_path '/users/{id}' do

      # GET /users/:id エンドポイントの定義
      operation :get do
          key :description, 'Find a user by ID'
          key :operationId, :find_user_by_id

          # パスパラメータ id の定義
          parameter name: :id do
            key :in, :path
            key :description, 'User ID'
            key :required, true
            key :type, :integer
            key :format, :int64 
          end

          # 成功レスポンスの定義
          response 200 do
          key :description, 'User'
          schema do
            key :required, [:id, :name]
            property :id do
              key :type, :integer
              key :format, :int64
            end
            property :name do
              key :type, :string
            end
          end
        end
      end
    end
  end
end
