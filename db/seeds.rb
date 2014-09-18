require 'open-uri'

### User Roles

roles = [
  {'id' => 1, 'name' => 'Administrator'},
  {'id' => 2, 'name' => 'Moderator'},
  {'id' => 3, 'name' => 'User'},
]

roles.each do |role|
  Role.find_or_create_by(role)
end


### Dev data

if Rails.env == "development"
	images = ["http://b.fastcompany.net/multisite_files/coexist/imagecache/1280/poster/2013/04/1681873-poster-1280-stock-chart.jpg", "http://peterwquigley.com/wp-content/uploads/2013/04/Fotolia_26669479_Subscription_Monthly_XXL.jpg", "http://amihackerproof.com/images/hackinghowsafeisyourcomputer.jpg", "http://conservativepapers.com/wp-content/uploads/2013/07/computer-hacker.jpg", "http://i.istockimg.com/file_thumbview_approve/2757930/2/stock-photo-2757930-computer-hacker.jpg"]

	while Article.count < 10 do
		data = Nokogiri::HTML(open("http://hipsum.co/?paras=4&type=hipster-centric").read)
		content = ""
		ex = ""
		data.css(".hipsum p").each do |p|
			content += p.text + "\n"
		end

		(15 + rand(15)).times do
			ex += content.split(" ").sample + " " 
		end

		title = content.split(" ").sample + " " + content.split(" ").sample
		title = title.capitalize

		pub = Time.now - (1 + rand(3)).days - (1 + rand(10)).hours

		a = Article.create( :title => title, :excerpt => ex, :content => content, :published => true, :published_at => pub, :featured_image => images.sample ) 
	end
end
