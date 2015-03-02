# ActsResponsible

## Installation

Add this line to your application's Gemfile:

    gem 'acts_responsible'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_responsible

## Usage

1.  Add `acts_responsible` to your API controller(s):

    ```
    include ActsResponsible

    class Api::V1::ApiController < ApplicationController

      acts_responsible('api/v1')

    end
    ```

2.  Render your responses, complete with errors or metadata:

    ```
    class Api::V1::PostsController < API::V1::ApiController

      def index
        @posts = Post.all
        # 200 OK with a root-level `posts` collection that renders @posts using a "posts/post" RABL template
        render_response @posts, 'posts', 'posts/post'
      end
      
      def create
        @post = Post.new(article_params)
        if @post.save
          # render the new post's `id` using a simple "id" RABL template
          render_response @post, 'post', 'id'
          # OR we could simply render a 200 OK with empty body
          render_empty_response
        else
          # take an HTTP status code and automatically parse ActiveRecord errors
          render_error :unprocessable_entity, @post.errors
        end
      end

    end
    ```

-   Example `posts/post.rabl` template:

    ```
    attributes :id, :title, :body

    node :created_at do |post|
      post.updated_at.utc.to_i
    end
    ```

-   Example `id.rabl` template:

    ```
    attributes :id
    ```


## Contributing

1. Fork it ( https://github.com/danlite/acts_responsible/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
