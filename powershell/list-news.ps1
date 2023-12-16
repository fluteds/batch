param([string]$RSS_URL = "http://feeds.skynews.com/feeds/rss/world.xml", [int]$MaxCount = 20)

try {
	[xml]$Content = (invoke-webRequest -uri $RSS_URL -useBasicParsing).Content

	"`n🌍 $($Content.rss.channel.title)"
	"✍️ $($Content.rss.channel.description)"
	"📎 View More: $($Content.rss.channel.link)"
	"`n"
	
	[int]$Count = 0
	foreach ($item in $Content.rss.channel.item) {
		"📰 $($item.title)"
		#"📅 $($item.pubDate)"
		#"📎 $($item.link)"
		
		$Count++
		if ($Count -eq $MaxCount) { break }
	}
	cmd /c pause | out-null
} catch {
	"Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
