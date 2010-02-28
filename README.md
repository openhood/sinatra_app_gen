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
    sinatra_app my_app --namespace=sinatra_sequel
    or
    sinatra_app my_app --namespace=SinatraSequel
    
    # Use MongoMapper instead of Sequel
    sinatra_app my_app --orm=MongoMapper

    ... WIP