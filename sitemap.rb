require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.website.com'
SitemapGenerator::Sitemap.create do
  add '/home', changefreq: 'daily', priority: 0.9
  add '/blog', changefreq: 'weekly'
  add '/contact', changefreq: 'weekly'
end

# Not needed if you use the rake tasks
SitemapGenerator::Sitemap.ping_search_engines
