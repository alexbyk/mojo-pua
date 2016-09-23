use Evo 'Test::More; Mojo::Pua PUA';

isa_ok PUA, 'Mojo::Pua';

done_testing;


use Evo 'Mojo::Pua PUA';
PUA->get('http://mail.ru')->then(sub {...});
