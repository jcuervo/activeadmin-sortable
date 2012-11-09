# Active Admin Sortable

This gem extends ActiveAdmin so that your index page's table rows can be 
sortable via a drag-and-drop interface.

## Prerequisites

This extension assumes that you're using 
[acts_as_list](https://github.com/rails/acts_as_list) on any model you want to 
be sortable.

```ruby
class Page < ActiveRecord::Base
  acts_as_list
end
```

## Usage

### Add it to your Gemfile

```ruby
gem 'activeadmin-sortable'
```

### Include the JavaScript in active_admin.js

```javascript
//= require activeadmin-sortable
```

### Configure your ActiveAdmin Resource

```ruby
ActiveAdmin.register Page do
  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column
  config.paginate   = false # optional; drag-and-drop across pages is not supported

  sortable # creates the controller action which handles the sorting

  index do
    sortable_handle_column # inserts a drag handle
    # other columns...
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
