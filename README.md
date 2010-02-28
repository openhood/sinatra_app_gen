Sinatra App Gen
---------------

Simple rubigen-based sinatra application generator

How-to use ?
------------

    gem install sinatra_app_gen

    # By default it generate a Sequel backed app
    sinatra_app my_app
    
    # Change the application base module name
    # given module name is camelized
    sinatra_app my_app sinatra_sequel
    or
    sinatra_app my_app SinatraSequel
    
    # Use MongoMapper instead of Sequel
    sinatra_app my_app sinatra_mongo mongo_mapper
    or
    sinatra_app my_app SinatraMongo MongoMapper

    ... WIP