[![Build Status](https://travis-ci.org/Ghostcakedev/simple_cms.svg?branch=master)](https://travis-ci.org/Ghostcakedev/simple_cms)

# Simple CMS

This is the quickest route to a typical Ruby on Rails website. Hit the ground running with Pages, Blog Posts and Contact Forms.

## Admin Section

**Login url:**
```
http://localhost:3000/admin
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
* run 'foreman start'
* Check output for assigned port and view in browser


## SEO and Sitemap Settings

Search engine optimization is important for small businesses. We have built in meta descriptions and tags for each page and an included sitemap generator for search engine submission.

To generate a sitemap for your website you will have to edit '/sitemap.rb' to include the pages you would like indexed. Once you have added your structure, run the following command to generate the sitemap locally.

```
ruby sitemap.rb
```

## Testing

RSpec is used for testing the application. To run the tests:

```
bundle exec rspec
```


## Heroku Deployment

It's super simple to deploy to the Heroku platform. This quickstart list assumes that you have PG installed on your computer. It's easy to install PG with "Postgres.app":http://postgresapp.com/

* Uncomment the gems under 'Gems for Heroku' line in the gemfile
* Bundle install
* Go to app on Heroku and add New Relic and Sendgrid
* Follow integration instructions for New Relic and Sendgrid


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
