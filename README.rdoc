= Sinatra Application Template

A base Sinatra application template. Just fork and build. Yay!
Includes DataMapper, RSpec, and Haml, all ready to go.

== Configuration

Dependencies and all configuration is done in <tt>environment.rb</tt>. Your database is also set up here. DataMapper will use sqlite3 by default. Tests use the sqlite3-memory adapter (no configuration needed).

Add your controller actions in <tt>application.rb</tt>. Views for these actions are placed in the <tt>views</tt> directory. Static files, including a stock stylesheet, go in the <tt>public</tt> directory. Models go in the <tt>lib</tt> directory and are auto-loaded. 

== Testing

Add your specs in <tt>spec</tt>; just require <tt>spec_helper.rb</tt> to pre-configure the test environment. A number of samples are provided (including a sample model, which can be removed). To run the specs:

  rake spec

== Getting Started

  rake db:migrate
  ruby application.rb
