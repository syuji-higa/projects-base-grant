$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/../'))

http_path = "/"
project_path = "htdocs"
css_dir = "css"
images_dir = "img"
javascripts_dir = "js"
sass_dir = "../compass/pc"
cache_dir = "../.sass-cache"
output_style = :expanded #:expanded or :nested or :compact or :compressed
line_comments = false
relative_assets = true
cache = true