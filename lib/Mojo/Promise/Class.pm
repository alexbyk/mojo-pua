package Mojo::Promise::Class;
use Evo -Class, 'Mojo::IOLoop';
with 'Evo::Promise::Class';

sub postpone ($self, $cb) : Over {
  Mojo::IOLoop->next_tick($cb);
}


1;
