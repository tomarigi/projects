# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://projects.tobitate-tomarigi.org"

SitemapGenerator::Sitemap.create do

  add root_path, :priority => 1.0, :changefreq => 'daily'

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
    add projects_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
    Project.find_each do |project|
      add project_path(project), :lastmod => project.updated_at
    end
end
