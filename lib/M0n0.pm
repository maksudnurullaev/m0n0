package M0n0;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by config file
  my $config = $self->plugin('Config');

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->route('/:controller/:action/*payload')->via('GET','POST')
    ->to(controller => 'initial', action => 'welcome', payload => undef);
}

1;
