require "extensions/views"

activate :views
activate :directory_indexes

set :relative_links, true
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'
set :layout, 'layouts/application'

configure :development do
 activate :livereload
end

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end

helpers do
  def nav_link(link_text, page_url, options = {})
    options[:class] ||= ""
    if current_page.url.length > 1
      current_url = current_page.url.chop
    else
      current_url = current_page.url
    end
    options[:class] << " active" if page_url == current_url
    link_to(link_text, page_url, options)
  end

  def menu_items
    {
      "/"         => "Home",
      "/work"     => "Client Work",
      "/projects" => "Projects",
      "/people"   => "People",
      "/contact"  => "Contact"
    }
  end

  def footer_items
    {
      "Client Work" => { "Case Studies" => "#", "Services"      => "#"},
      "Product"     => { "Upcase"       => "#", "Hound"         => "#", "FormKeep" => "#", "Books"   => "#"},
      "Open Source" => { "Bourbon"      => "#", "Factory Girl"  => "#", "Laptop"   => "#", "More..." => "#"},
      "Community"   => { "Playbook"     => "#", "Blog"          => "#", "Podcasts" => "#"},
      "People"      => { "Team"         => "#", "apprentice.io" => "#" },
      "Contact"     => { "Call Us"      => "#", "Visit Us"      => "#", "Hire Us"  => "#"}
    }
  end
end
