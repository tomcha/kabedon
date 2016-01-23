#!/usr/bin/env perl
use Mojolicious::Lite;

get '/' => sub {
  my $self = shift;
  $self->render(template => 'index');
};

get '/request' => sub {
  my $self = shift;
  my $dotsukitimes = $self->param('dotsukitimes');
  $self->render(template => 'request');
};


app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title '壁殴り代行サービス';
<h1>壁殴り代行サービス</h1>
%= form_for '/request' => begin
  %= select_field dotsukitimes =>[['1回殴り' => 1], ['2回殴り' => 2], ['3回殴り' => 3]]
  %= submit_button '依頼する'
%= end

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
