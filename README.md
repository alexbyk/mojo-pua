# NAME [![Build Status](https://travis-ci.org/alexbyk/mojo-pua.svg?branch=master)](https://travis-ci.org/alexbyk/mojo-pua)

Mojo::Pua - HTTP Client + Evo::Promises

# SYNOPSIS

```perl
  use Evo 'Mojo::Pua';
  my $ua = Mojo::Pua->new();

  $ua->get("http://alexbyk.com/")

    ->then(sub($res) { say $res->dom->at('title') })

    ->catch(sub($err) { say "ERR: $err"; say $err->res->body if $err->res; })

    ->finally(sub { Mojo::IOLoop->stop; });

  Mojo::IOLoop->start;
```

# INSTALLATION

  cpanm Mojo::Pua

# DESCRIPTION

!!!ATTENTION
This is first temporary release. Use it on your own risk.

This module is based on [Mojo::UserAgent](https://metacpan.org/pod/Mojo::UserAgent) and allows you to use promises ([Mojo::Promise](https://metacpan.org/pod/Mojo::Promise))

# FUNCTIONS

## pua\_delete 

## pua\_get

## pua\_head 

## pua\_options

## pua\_patch

## pua\_post 

## pua\_put

Perform non-blocking request and return a promise object. See [Mojo::UserAgent](https://metacpan.org/pod/Mojo::UserAgent), because this module right now is based on it
See [https://github.com/alexbyk/mojo-pua](https://github.com/alexbyk/mojo-pua) "examples" for more examples

# AUTHOR

alexbyk &lt;alexbyk.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by alexbyk.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
