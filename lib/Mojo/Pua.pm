package Mojo::Pua;
use Mojo::Base 'Mojo::UserAgent';
use Evo 'Evo::Export; Mojo::Promise *; Carp croak; Mojo::Pua::Error';

# VERSION

# LIB version

use constant PUA => __PACKAGE__->new();
export 'PUA';

# OO version
sub start ($self, $tx, $cb_empty = undef) {

  croak "Got callback but this class returns a Promise" if $cb_empty;
  my $d = deferred();

  my $pcb = sub ($ua, $tx) {
    my $res = $tx->success;
    return $d->resolve($res) if $res;

    my $err  = $tx->error;
    my $perr = Mojo::Pua::Error->new(
      res     => $tx->res,
      message => $err->{message},
      code    => $err->{code}
    );
    $d->reject($perr);
  };

  $self->SUPER::start($tx, $pcb);

  $d->promise;
}

1;

# ABSTRACT: HTTP Client + Evo::Promises

=head1 DESCRIPTION

!!!ATTENTION
This is first temporary release. Use it on your own risk.

This module is based on L<Mojo::UserAgent> and allows you to use promises (L<Evo::Promise>)

=head1 SYNOPSIS

C<Mojo::Pua> inherits all methods from L<Mojo::UserAgent> but returns L<Mojo::Promise> object for each request

  use Evo 'Mojo::Pua';
  my $ua = Mojo::Pua->new();

  $ua->get("http://alexbyk.com/")

    ->then(sub($res) { say $res->dom->at('title') })

    ->catch(sub($err) { say "ERR: $err"; say $err->res->body if $err->res; })

    ->finally(sub { Mojo::IOLoop->stop; });

  Mojo::IOLoop->start;


=head1 functions

=head1 PUA

A single instance of C<Mojo::Pua>.
  
  use Evo 'Mojo::Pua PUA';
  PUA->get('http://mail.ru')->then(sub {...});

=head1 SEE ALSO

L<Mojo::UserAgent>
L<Mojo::Promise>
L<https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Promise>

=cut
