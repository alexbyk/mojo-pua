use Evo 'Mojo::Pua *; Mojo::IOLoop; Evo::Prm *';


prm {
  then { pua_get('http://alexbyk.com') };

  then sub($res) { say $res->dom->at('title') };
  catch sub($err) { say "$err", $err->res->dom->at('title') };

  finally { Mojo::IOLoop->stop };
};

Mojo::IOLoop->start;
