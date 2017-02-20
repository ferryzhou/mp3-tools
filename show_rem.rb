require 'wombat'

data = Wombat.crawl do
  base_url "http://www.remchurch.org/index.php/zh/2013-11-16-05-09-45/2013-10-05-03-21-09/sermons?start=20"
  path "/"

  sermons "xpath=//*[@id[contains(., 'sermon')]]", :iterator do
    title 'css=td.ss-title'
    speaker 'css=td.ss-speaker'
    date 'css=td.ss-date'
  end
end

p data
