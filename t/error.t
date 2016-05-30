use Evo 'Test::More; Mojo::Pua::Error';

my $err = Mojo::Pua::Error->new(message => 'msg', code => '404');
is $err->to_string, "[404] msg";

$err = Mojo::Pua::Error->new(message => 'msg');
is "$err", "[connection error] msg";

done_testing;
