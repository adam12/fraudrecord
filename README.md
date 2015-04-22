# Fraud Record

Gem wrapper for [fraudrecord.com](https://fraudrecord.com).

[![Build Status](https://secure.travis-ci.org/seanhandley/fraudrecord.png?branch=master)] (http://travis-ci.org/seanhandley/fraudrecord) [![Gem Version](https://badge.fury.io/rb/fraudrecord.png)](http://badge.fury.io/rb/fraudrecord) [![Dependency Status](https://gemnasium.com/seanhandley/fraudrecord.svg)](https://gemnasium.com/seanhandley/fraudrecord) [![Coverage Status](https://coveralls.io/repos/seanhandley/fraudrecord/badge.png?branch=master)](https://coveralls.io/r/seanhandley/fraudrecord?branch=master) [![Code Climate](https://codeclimate.com/github/seanhandley/fraudrecord.png)](https://codeclimate.com/github/seanhandley/fraudrecord)

## Installing

```
gem install fraudrecord
```

or

(in Gemfile or .gemspec)
```ruby
gem 'fraudrecord'
```

then

```ruby
require 'fraudrecord'
```

## Usage

First, you will need to create an account on https://www.fraudrecord.com and make a reporter profile. This will create an API key for you. Expose this to your Ruby runtime in the form of an environment variable i.e.

```
export FRAUD_RECORD_API_KEY=f656a57c78
```

Secondly, call the `query` method with a Ruby hash of parameters containing the data you wish to query. This will automatically be salted and hashed before being submitted to Fraud Record.

```ruby
Fraudrecord.query name: 'Billy Jones', email: 'billy@fraudsters.com'
=> {:value=>30, :count=>3, :reliability=>8.2, :report=>"https://www.fraudrecord.com/api/?showreport=2bbf78f6f8"}
```

Fraud Record accepts variables as long as the variable name consists of [a-z] characters, 16 characters max. Uppercase variables will be converted to lowercase internally. The dash (hyphen) character is also accepted. For example, "paypal-email" is a valid variable name.

There is also a common set of accepted variables to choose from:

| Variable Name | Description                                                 |
|---------------|-------------------------------------------------------------|
| name          | Client name.                                                |
| password      | Client password. Usually a good indicator of identity.      |
| company       | Company name which the client inputs.                       |
| email         | Client's email address.                                     |
| address       | Client's postal address.                                    |
| phone         | Client's phone number.                                      |
| ip            | Client's registration IP address.                           |
| hostname      | Hostname for server clients.                                |
| accountuser   | Hosting account username.                                   |
| accountpass   | Hosting account password.                                   |
| domain        | Domain name of the hosting client.                          |
| payment       | Payment processor identification, e.g. paypal email address |
| ccname        | Name on credit card                                         |
| ccnumber      | Credit card number.                                         |

To learn more, please read https://www.fraudrecord.com/developers.
