#audit_servers_without_halo

Version: *1.1*
<br />
Author: *CloudPassage Integrations*

This Ruby script checks Amazon Web Services (AWS) regions for servers that do not have Halo installed. It might be the case that a server was deployed adhoc, or outside of a defined DEVOPS process. This script discovers those instances and creates a report containing identifying attributes to help understand where the instance was deployed and possibly why. The number of cloud providers and regions can be customized and we encourage those updates. Amazon AWS is provided only as an example.

##Requirements and Dependencies

* The Ruby interpreter must be installed on the machine that executes the script.

##Usage

###*Installation*

1. Install the gem bundler
```
    gem install bundler
```

2. Install the required ruby gems using bundler.
```
    bundle install
```

3. Install the CloudPassage API Gem
```
    gem install cloudpassage-0.8.0.gem
```

Then update the "providers" Hash with your specific Cloud Provider, credential_path and regions where you have servers deployed. Place the values inside of configs/portal.yml

```
    key_id:
    secret_key:
    api_hostname : https://api.cloudpassage.com
    aws_key_id:
    aws_secret_key:
    aws_region:
```

###*Sample Output*

The expected output should look like the following:

```
    ruby main.rb

    Halo is not installed on i-1480fea1
    Halo is not installed on i-7b55125f
    Halo is not installed on i-2d7588ef
```

##License

Copyright (c) 2017, CloudPassage, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the CloudPassage, Inc. nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL CLOUDPASSAGE, INC. BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED ANDON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 
<!--
#CPTAGS:community-supported audit
#TBICON:images/ruby_icon.png
-->
