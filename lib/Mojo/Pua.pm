package Mojo::Pua;
use Evo 'Evo::Export *; ::Class';

# VERSION
use constant SINGLE => our $SINGLE
  = Mojo::Pua::Class->new(max_connections => 100);

sub pua_delete(@opts) : Export  { SINGLE()->delete(@_) }
sub pua_get(@opts) : Export     { SINGLE()->get(@_) }
sub pua_head(@opts) : Export    { SINGLE()->head(@_) }
sub pua_options(@opts) : Export { SINGLE()->options(@_) }
sub pua_patch(@opts) : Export   { SINGLE()->patch(@_) }
sub pua_post(@opts) : Export    { SINGLE()->post(@_) }
sub pua_put(@opts) : Export     { SINGLE()->put(@_) }


1;

# ABSTRACT: HTTP Client + Evo::Promises

=head1 SYNOPSIS

  use Evo 'Mojo::Pua *; Mojo::IOLoop';

  pua_get('http://alexbyk.com/')

    ->then(sub($res) { say $res->dom->at('title') })

    ->catch(sub($err) { say "$err"; $err->res and say $err->res->body })

    ->finally(sub { Mojo::IOLoop->stop });


  Mojo::IOLoop->start;

=head1 DESCRIPTION

!!!ATTENTION
This is first temporary release. Use it on your own risk.

This module is based on L<Mojo::UserAgent> and allows you to use promises (L<Evo::Promise>)


=head1 FUNCTIONS

=head2 pua_delete 

=head2 pua_get

=head2 pua_head 

=head2 pua_options

=head2 pua_patch

=head2 pua_post 

=head2 pua_put

Perform non-blocking request and return a promise object. See L<Mojo::UserAgent>, because this module right now is based on it
See L<https://github.com/alexbyk/mojo-pua> "examples" for more examples


=cut
