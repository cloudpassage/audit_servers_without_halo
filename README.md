#audit_servers_without_halo

Version: *1.0*
<br />
Author: *Eric Hoffmann* - *ehoffmann@cloudpassage.com*

This Ruby script checks Amazon Web Services (AWS) regions and Rackspace for servers that do not have Halo installed. It might be the case that a server was deployed adhoc, or outside of a defined DEVOPS process. This script discovers those instances and creates a report containing identifying attributes to help understand where the instance was deployed and possibly why. The number of cloud providers and regions can be customized and we encourage those updates. Amazon AWS and Rackspace are provided only as an example.


##List of Files

* audit_servers_without_halo_installed.rb
* README.md
* Gemfile

##Requirements and Dependencies

* The Ruby interpreter must be installed on the machine that executes the script.
* These Ruby gems are required:  fog, json, rest_client, base64

##Usage

###*Installation*

First, install the required ruby gems using bundler.
```
    bundle install
```

Then update the "providers" Hash with your specific Cloud Provider, credential_path and regions where you have servers deployed. Lines 118-135 are were the updates should be applied.

```
    118 # Define providers, credential_paths and regions (if applicable) where your servers
    119 # reside. add/update this based on your environment. An example aws.yml
    120 # file should be formatted like the following:
    121 # :default:
    122 #     :aws_access_key_id:     ABC123ABC123ABC123AB
    123 #     :aws_secret_access_key: ABC123ABC123ABC123ABC123ABC123ABC123ABC1
    124 # or a rackspace.yml example:
    125 # :default:
    126 #     :rackspace_username:  user_name
    127 #     :rackspace_api_key:   ABC123ABC123ABC123ABC123ABC123ABC123ABC1
    128 providers = { "AWS" => ["/path/to/aws.yml", ['us-west-1', 'us-east-1']],
    129               "Rackspace" => ["/path/to/rackspace.yml", ['N/A']]}
    130 
    131 # Pass in portal, key_id, key_secret to setup a Halo API session
    132 # key_id/key_secret can be created from portal.cloudpassage.com
    133 # Settings > Site Administration > API Keys
    134 # At least a read-only key is required
    135 @api = APICalls.new("api.cloudpassage.com", 'abc123abc', 'abc123abc123abc123abc123abc123ab')
```

###*Sample Output*

The expected output should look like the following:

    ruby audit_servers_without_halo_installed.rb
    Halo is not installed on: AWS, ["22.23.123.119", ["ec2-22-23-123-119.compute-1.amazonaws.com", "i-4ab7gd19", "ehoffmann-staging-srv1"]]
    Halo is not installed on: Rackspace, ["54.23.211.72", ["Dev-Testing", "31232944"]]
    Halo is not installed on: Rackspace, ["50.46.116.14", ["Prod-DB-1", "11437928"]]

##License

Copyright (c) 2013, CloudPassage, Inc.
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

 
