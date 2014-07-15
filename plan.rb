require "digest/sha1"
require "base64"

module Plan
  class App

    # Name of your project.
    def name
      "foo"
    end

    # List of dependencies. This list is a starting point, and you can
    # add more either now or later. For each gem, we'll include the
    # latest version in the final .gems manifest. Feel free to change
    # it at will.
    def gems
      [
        "sinatra",
        "slim",
        "shield",
        "sequel",
        "sqlite3"
      ]
    end

    def destination
      "#{name}/app.rb"
    end
  end

  class Gitignore < App
    def destination
      "#{name}/.gitignore"
    end
  end

  class Readme < App
    def destination
      "#{name}/README.md"
    end
  end

  class Makefile < App
    def destination
      "#{name}/makefile"
    end
  end

  class Config < App
    def destination
      "#{name}/config.ru"
    end
  end

  class Css < App
    def destination
      "#{name}/public/css/styles.css"
    end
  end

  module Models
    class Init < App
      def destination
        "foo/models/init.rb"
      end
    end

    class User < App
      def destination
        "foo/models/user.rb"
      end
    end
  end

  module Helpers
    class Init < App
      def destination
        "#{name}/helpers/init.rb"
      end
    end
  end

  module Routes
    class Init < App
      def destination
        "#{name}/routes/init.rb"
      end
    end

    class Style < App
      def destination
        "#{name}/routes/style.rb"
      end
    end

    class Login < App
      def destination
        "#{name}/routes/login.rb"
      end
    end

    class Main < App
      def destination
        "#{name}/routes/main.rb"
      end
    end
  end

  module Views
    class Layout < App
      def destination
        "#{name}/views/layout.slim"
      end
    end

    class Home < App
      def destination
        "#{name}/views/home.slim"
      end
    end
  end

  module Tasks
    class InitDB < App
      def destination
        "#{name}/tasks/init_db.rb"
      end
    end
  end
end

instructions = <<-EOS
  You have just created a Cuba application. Now, go ahead and install
  the dependencies with the following commands:

    $ cd #{Plan::App.new.name}
    $ make         # Creates a gemset and lists dependencies.
    $ make install # Installs dependencies

  Once you are done with the setup, run the webserver:

    $ rackup

  Now you can head to http://localhost:9292.

  In development mode, it is good to have your application code
  reloaded between requests. For that, we recommend the use of the
  shotgun gem:

    $ gem install shotgun
    $ shotgun

  Both shotgun and rackup use webrick by default. While it's a nice
  server, you may get faster responses with something like puma:

    $ gem install puma
    $ shotgun -s puma

  Now head to http://localhost:9393 to check your creation. Enjoy!
EOS

puts instructions
puts
