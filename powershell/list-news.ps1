<# 
.SYNOPSIS
    Retrieves and displays RSS feed data from a specified URL.

.DESCRIPTION
    This PowerShell script fetches and displays RSS feed data from a given URL. It first attempts to retrieve the content of the RSS feed using Invoke-WebRequest cmdlet. If successful, it parses the content as XML and displays the title, description, and a link to view more information about the feed. Then, it iterates through the feed items and displays their titles along with an emoji representing a newspaper. The script provides an option to specify the maximum number of feed items to display.

.PARAMETER RSS_URL
    Specifies the URL of the RSS feed. Default value is "http://feeds.skynews.com/feeds/rss/world.xml".

.PARAMETER MaxCount
    Specifies the maximum number of feed items to display. Default value is 20.

.EXAMPLE
    Display feed data from a custom URL:
    PS C:\> .\Get-RSSFeed.ps1 -RSS_URL "http://example.com/feed.xml" -MaxCount 10
    This command will fetch the RSS feed from "http://example.com/feed.xml" and display up to 10 feed items.
#>

param([string]$RSS_URL = "http://feeds.skynews.com/feeds/rss/world.xml", [int]$MaxCount = 20)

try {
	[xml]$Content = (invoke-webRequest -uri $RSS_URL -useBasicParsing).Content

	"`n🌍 $($Content.rss.channel.title)"
	"$($Content.rss.channel.description)"
	"View More: $($Content.rss.channel.link)"
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
