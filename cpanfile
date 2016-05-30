requires 'perl',         '5.20.0';
requires 'Evo',          '0.0215';
requires 'Mojolicious',  '6.0';

on test => sub {
  requires 'Test::More', '0.88';
};

on 'develop' => sub {
  requires 'Pod::Coverage::TrustPod';
  requires 'Test::Perl::Critic', '1.02';
};
