[![Build Status](https://travis-ci.org/websitescenes/simple_cms.svg?branch=master)](https://travis-ci.org/websitescenes/simple_cms)
[![Coverage Status](https://coveralls.io/repos/websitescenes/simple_cms/badge.svg?branch=master&service=github)](https://coveralls.io/github/websitescenes/simple_cms?branch=master)

![Alt text](http://www.ghostcake.com/cms-logo.jpg "Ruby on Rails Content Management System")

*****

This is the quickest route to a typical Ruby on Rails website. Hit the ground running with Pages, Blog Posts and Contact Forms.

**Demo url:**
```
cms-demo.ghostcake.com

note: database is reset every hour. If you get an error, try again in a moment. Also, all demo users are using the same credentials so there may a conflict while editing data every once and a while.
```


## Admin Section

**Login url:**
```
http://localhost:5000/admin
```


**Default Credentials:**
```
user: admin@example.com
password: password
```

## Default Pages

You can add as many pages as you want but the system comes with three default pages. We find these are the typical pages in a small to medium sized website.

*	Home
* Blog
* Contact

**Home**

The default page that the Rails root is mapped to.

**Blog**

Simple CMS includes blog posts out of the box. Blog posts are associated with the blog page.


**Contact**

Almost every website needs a contact form, so we've included one by default. The contact form is associated with the contact page.


## Additional Pages

You can add and delete as many pages as needed in the pages CMS section. Pages are listed in alphabetical order.


## Menu

The menu is two level. Each menu item is associated with a page and can belong to another menu item. Child items will show up in a dropdown beneath the parent in the main menu nav. Menu items can be added, deleted and sorted to create the optimal website navigation.


## Getting Started


These are the steps to getting Simple CMS running in a local environment. We are assuming that you have Ruby and Ruby on Rails installed.

* git clone https://github.com/Ghostcakedev/simple_cms.git 'your-website'
* cd your-website
* Switch to the appropriate Ruby version and desired gemfile
* run 'bundle install'
* run 'rake db:migrate'
* run 'bundle exec guard'
* Check output for assigned port and view in browser

## Configuration Options

The User and Page model files have configuration options for things like CMS section access and front end display.

###User Model

```
CAN_ACCESS_USERS					= 'true'
CAN_ACCESS_MENUS					= 'true'
CAN_ACCESS_BLOG_POSTS			= 'true'
CAN_ACCESS_PAGES					= 'true'
CAN_ACCESS_CONTACT_FORMS	= 'true'
```

###Page Model

```
DASHBOARD_MESSAGE         = "Welcome to Simple CMS."
DEFAULT_DESCRIPTION       = ""
DEFAULT_KEYWORDS          = ""
SHOW_PAGE_TITLES	        = 'true'
SHOW_BANNER_IMAGES        = 'true'
SHOW_IMAGES               = 'true'
SHOW_SEO_OPTIONS     	    = 'true'
SHOW_DESCRIPTION_INPUT  	= 'true'
SHOW_IMAGE_UPLOAD       	= 'true'
SHOW_BANNER_IMAGE_UPLOAD  = 'true'
SORT_BY                   = "name"
SORT_ORDER                = "ASC"
```

## SEO and Sitemap Settings

Search engine optimization is important for small businesses. We have built in meta descriptions and tags for each page and an included sitemap generator for search engine submission. To set the default meta description and meta tags edit 'app/models/page.rb'.

```
DEFAULT_DESCRIPTION = "Add a default description here."
DEFAULT_KEYWORDS    = "Keywords,are,comma separated,like,this"
```

To generate a sitemap for your website you will have to edit '/sitemap.rb' to include the pages you would like indexed. Once you have added your structure, run the following command to generate the sitemap locally.

```
ruby sitemap.rb
```

## Module Generator

Quickly add cms sections with the custom module generator:

```
rails generate module NAME [BANNER_IMAGES] [IMAGES] [options]

Example:
	rails generate ExampleModule true true
```

The above example will create a CMS section at /admin/example_modules. Each example module can have banner images and images.

## Testing

RSpec is used for testing the application. To run the tests:

```
bundle exec rspec
```

Tests can also be run through Guard

```
bundle exec guard
```

## Contributing

* Fork it.
* Create a branch (git checkout -b branch-name)
* Commit your changes
* Push to the branch (git push origin branch-name)
* Create a pull request with description from your branch into develop


## Comments

The project is an app, not a gem. I plan on keeping it that way. I like locking down gem versions to ensure a functional CMS on installations. I don't want to support multiple rubies or gem versions.


## Roadmap

The project is still in early development. The stable, production ready version will v1.0.

--------------------------------------------------------------------------------------

The MIT License (MIT)

Copyright (c) 2015 GhostCake

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
