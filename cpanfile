requires 'perl',        '5.20.0';
requires 'Evo',          '0.214';

on test => sub {
  requires 'Test::More', '0.88';
};

on 'develop' => sub {
  requires 'Pod::Coverage::TrustPod';
  requires 'Test::Perl::Critic', '1.02';
};
