# NAME

Mojo::Pua - HTTP Client + Evo::Promises

# VERSION

version 0.001

# SYNOPSIS

    use Evo 'Mojo::Pua *; Mojo::IOLoop';

    pua_get('http://alexbyk.com')

      ->then(sub($res) { say $res->dom->at('title') })

      ->catch(sub($err) { say "$err", $err->res->dom->at('title') })

      ->finally(sub { Mojo::IOLoop->stop });


    Mojo::IOLoop->start;

# DESCRIPTION

!!!ATTENTION
This is first temporary release. Use it on your own risk.

This module is based on [Mojo::UserAgent](https://metacpan.org/pod/Mojo::UserAgent) and allows you to use promises ([Evo::Promise](https://metacpan.org/pod/Evo::Promise))

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
