use Evo 'Mojo::Pua *; Mojo::IOLoop';


# 200
pua_get('http://alexbyk.com')

  ->then(sub($res) { say $res->dom->at('title') })

  # same as ->to_string
  ->catch(sub($err) { say "$err"; $err->res and say $err->res->body })

  ->finally(sub { Mojo::IOLoop->stop });


Mojo::IOLoop->start;
