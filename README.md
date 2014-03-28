### rlipt.rb

I needed a super simple way to get all the lines associated with one
IP address in a Rails log file, with UUID tagged lines like this:

     [bcd4103a933a595f85a8d929694de666] Started GET "/foo/bar/12" for 1.2.3.4 at 2014-03-28 06:25:28 +0000

That's all this script does.

    ./rlipt.rb 1.2.3.4 log/production.log

