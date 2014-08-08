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

    # List of dependencies for development. This list is a starting point, and you can
    # add or more or remove either now or later. For each gem, we'll include the
    # latest version in the final .gems.dev manifest. Feel free to change
    # it at will.
    def gems_dev
      [
        "shotgun", # Code reloader
        "puma" # Faster server
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
        "#{name}/models/init.rb"
      end
    end

    class User < App
      def destination
        "#{name}/models/user.rb"
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
    $ make gems # Creates a gemset and lists dependencies.
    $ make install # Installs dependencies.
    $ make setup # Create basic configurations for your app.

  Once you are done with the setup, run the webserver:

    $ make server

  Now you can head to http://localhost:9393.
EOS

puts instructions
puts
