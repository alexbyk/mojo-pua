#BEGIN { $ENV{MOJO_USERAGENT_DEBUG} = 1 }
use Mojolicious::Lite;
use Evo 'Test::More; Mojo::Pua';

# setup
any '/test' =>
  sub($c) { $c->render(text => join ';', "working", $c->req->url); };

any '/test_post' =>
  sub($c) { $c->render(text => join ';', "working", $c->req->body); };

any '/test_404' => sub($c) { $c->res->body("Foo"); $c->rendered(404); };


use Mojo::Server::Daemon;
app->log->level("error");
my $server = Mojo::Server::Daemon->new(
  app    => app(),
  silent => 1,
  listen => ['http://127.0.0.1']
)->start;
my $port = $server->ioloop->acceptor($server->acceptors->[0])->port;

my $ua = Mojo::Pua->new();

# shouldn't use callback
eval {
  $ua->get("http://127.0.0.1:$port", sub($res) {fail})->then();
};
like $@, qr/Got callback.+$0/;

POST_FORM: {
  my $res;
  $ua->post("http://127.0.0.1:$port/test_post", form => {foo => 33})
    ->then(sub { $res = shift; })->finally(sub { Mojo::IOLoop->stop });
  Mojo::IOLoop->start;
  is $res->body, 'working;foo=33';
}

# promise get
GET: {
  my $res;
  $ua->get("http://127.0.0.1:$port/test")->then(sub { $res = shift; })
    ->finally(sub { Mojo::IOLoop->stop });
  Mojo::IOLoop->start;
  is $res->body, 'working;/test';
}

GET_FORM: {
  my $res;
  $ua->get("http://127.0.0.1:$port/test", form => {foo => 33})
    ->then(sub { $res = shift; })->finally(sub { Mojo::IOLoop->stop });
  Mojo::IOLoop->start;
  is $res->body, 'working;/test?foo=33';
}

ERROR: {
  my $err;
  $ua->get("http://127.0.0.1:$port/test_404")->catch(sub { $err = shift; })
    ->finally(sub { Mojo::IOLoop->stop });
  Mojo::IOLoop->start;
  is $err->res->body, 'Foo';
  like $err->to_string, qr/404/;
}

done_testing;
