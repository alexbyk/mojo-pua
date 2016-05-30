use Evo 'Test::More; Mojo::Pua *';

ok pua_delete('http://some.address')->can('then');
ok pua_get('http://some.address')->can('then');
ok pua_head('http://some.address')->can('then');
ok pua_options('http://some.address')->can('then');
ok pua_patch('http://some.address')->can('then');
ok pua_post('http://some.address')->can('then');
ok pua_put('http://some.address')->can('then');

done_testing;
