package Mojo::Pua::Error;
use Evo -Class;
use overload bool => sub {1}, '""' => sub { $_[0]->to_string }, fallback => 1;

has 'message', required => 1;
has 'code';
has 'res';


sub to_string($self) {
  $self->code
    ? "[${\$self->code}] ${\$self->message}"
    : "[connection error] ${\$self->message}";
}


1;
