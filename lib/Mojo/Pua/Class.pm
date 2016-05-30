package Mojo::Pua::Class;
use Mojo::Base 'Mojo::UserAgent';
use Evo '-Promise::Class; -Promise *; Carp croak; Mojo::Pua::Error';

no warnings 'redefine';
*Evo::Promise::Class::loop_postpone = sub($cb) : prototype(&) {
  Mojo::IOLoop->next_tick($cb);
};


sub start ($self, $tx, $cb_empty = undef) {

  croak "Got callback but this class returns a Promise" if $cb_empty;
  my $promise = promise sub ($resolve, $reject, @other) {

    my $pcb = sub ($ua, $tx) {
      my $res = $tx->success;
      return $resolve->($res) if $res;

      my $err  = $tx->error;
      my $perr = Mojo::Pua::Error->new(
        res     => $tx->res,
        message => $err->{message},
        code    => $err->{code}
      );
      $reject->($perr);
    };

    $self->SUPER::start($tx, $pcb);
  };

  $promise;
}


1;

# ABSTRACT: HTTP Client Class + Evo::Promises

=head1 SYNOPSIS


  use Evo 'Mojo::Pua::Class';
  my $ua = Mojo::Pua::Class->new();

  $ua->get("http://alexbyk.com/")

    ->then(sub($res) { say $res->dom->at('title') })

    ->catch(sub($err) { say "ERR: $err"; say $err->res->body if $err->res; })

    ->finally(sub { Mojo::IOLoop->stop; });

  Mojo::IOLoop->start;

=head2 DESCRIPTION

C<Mojo::Pua::Class> inherits all methods from L<Mojo::UserAgent> but returns L<Evo::Promise::Class> object for each request

=cut
