Paths of Glory
==============

Paths of Glory sets you on the road to achievements!

In short, it's a re-usable model for creating an achievement system.

It's extracted from http://peertester.com and inspired by: http://stackoverflow.com/questions/885277/how-to-implement-an-achievement-system-in-ror



Installation
============

Paths of Glory is easy to install.

As a plugin:

    ./script/plugin install git://github.com/paulca/paths_of_glory.git

Or as a gem. Add this to your environment.rb:
  
    gem install paths_of_glory

    config.gem 'paths_of_glory', :lib => false

Then generate the migration:

    ./script/generate paths_of_glory

And run the migration:

    rake db:migrate
    
This creates the tables.

Then, in your User model:

    class User < ActiveRecord::Base
      include Achievements
    end

and in config/environment.rb, add app/models/achievements to your load path:

    config.load_paths += %W( #{RAILS_ROOT}/app/models/achievements )

Basic Usage
===========

Paths of Glory gives you access to a DSL to generate achievements. Achievements can have multiple levels or can just be standalone achievements.

The pattern is basically:

Create an achievement:

    ./script/generate achievement Glory
    
This gives you `app/models/achievements/glory.rb` and `app/models/achievements/glory_observer.rb` with some bootstrapped code.

You're on your own after that. Have fun!


Running the tests
=================

You can run the tests by checking out the code into vendor/plugins of a Rails app and running:

    rake

About me
========

I'm Paul Campbell. I'm an avid Ruby on Rails web developer. Follow my ramblings at [http://www.pabcas.com](http://www.pabcas.com)

Follow me on Twitter [http://twitter.com/paulca](http://twitter.com/paulca)

Copyright (c) 2010 Paul Campbell, released under the MIT license