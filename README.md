# RedmineKaminari

Kaminari pagination adapted for Redmine. Now, "Paginator.new" in the past!

## Installation

Add this line to your application's Gemfile:

    gem 'redmine_kaminari'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redmine_kaminari

## Usage

    # controller
    class FooController < ApplicationController

      def index
         # per_page_option -- redmine's method
         @collection = Foo.page(params[:page]).per(per_page_option)
      end
    end

    #view

    %p.pagination
        = paginate @collection

## Contributing

1. Fork it ( http://github.com/shipiev/redmine_kaminari/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
