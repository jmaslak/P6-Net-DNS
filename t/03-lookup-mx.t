use v6;
use Test;

plan 3;

my $server = %*ENV<DNS_TEST_HOST> // '8.8.8.8';

use Net::DNS;

my $resolver;
say '# using %*ENV<DNS_TEST_HOST> = '~$server if $server ne '8.8.8.8';
ok ($resolver = Net::DNS.new($server)), "Created a resolver";

my $response;
ok ($response = $resolver.lookup-mx("raku.org")), "Lookup mx for raku.org...";
ok ($response[0] eq "80.127.186.58"), "...Got a valid response!"; # this will probably need to change in the future