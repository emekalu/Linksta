[![Gem Version](https://badge.fury.io/rb/linksta.svg)](https://badge.fury.io/rb/linksta)

# Linksta

**Link checker for BBC Radio & Music sites.**

The idea is to quickly check a page for broken links by doing a status check on all the relative URL's on the page.

There are 4 parts to this tool, the URL, the base URL, the regex and the filename.  

* **URL** is the page that you want to check for broken links, e.g `www.bbc.co.uk/radi04`
* **Base URL** is used with the relative URL from the regex to create a full URL, e.g `www.bbc.co.uk`
* **Regex** is the point of the URL that you want to keep from the regex, e.g `bbc.co.uk/radio/new`, specifying `/radio` would create `/radio/new`.  
* **Filename** is markdown (.md) file where all the page links are stored, this can be useful for manual checks, e.g `file.md`

## Installation

    gem install linksta

## Usage

### Command Line

```
linksta check <url> <base_url> <regex> <filename>
```

**Examples**

```
linksta check http://www.bbc.co.uk/radio http://www.bbc.co.uk/radio radio.md
```

**Output**

Once running, you'll see either a 200 with `Status is 200 for <URL>` or `Status is NOT GOOD for <URL>`.

### Script It

```ruby
require 'linksta'

url = 'http://www.live.bbc.co.uk/radio'
base = 'http://www.live.bbc.co.uk'
reg = '/radio'
filename = 'radio.md'

page = Linksta::SaveLinks.new(url, filename)
status = Linksta::CheckResponse.new(url, base, reg, filename)

page.capture_links
status.check_links
```

### From a File

If you have a lot of URLs that you want to check all the time using from a file is an alternative option.  This will utilise the smoke option, then point to a YAML file with the extension.  In some situations, we are deploying applications that we don't want public facing, so ensuring they 404 is essential.  There is a status code option to allow a specific status code to be set against a group of URL's, ensuring builds fail if the right code conditions are met.

```
linksta smoke test.yaml
```

Example YAML Config:

```yaml
base: 'http://www.bbc.co.uk'

concurrency: 100

headers:
 -
   X-content-override: 'https://example.com'

status_code: 200

paths:
  - /radio
  - /radio/new
```

Via a Ruby script:

```ruby
require 'linksta'

tests = Linksta::Checker.new("path/to.yaml")
tests.smoke
```
