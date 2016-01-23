#!/usr/bin/env perl
use Mojolicious::Lite;

my $cnt = 0;

get '/' => sub {
  my $self = shift;
  $self->stash(cnt => $cnt);
  $self->render(template => 'index');
};

get '/request' => sub {
  my $self = shift;
  my $dotsukitimes = $self->param('dotsukitimes');
  $cnt += $dotsukitimes;
  $self->stash(dotsukitimes => $dotsukitimes);
  $self->render(template => 'request');
};


app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title '壁殴り代行サービス';
<h1>壁殴り代行サービス</h1>
<p>当サービスでは、通算<%= $cnt %>回の壁殴りを実施しました。</p>
%= form_for '/request' => begin
  %= select_field dotsukitimes =>[['1回殴り' => 1], ['2回殴り' => 2], ['3回殴り' => 3]]
  %= submit_button '依頼する'
%= end

@@ request.html.ep
% layout 'default';
% title '壁殴り代行サービス';
<h1>壁殴り代行サービス</h1>
<p>
% for my $i (1..$dotsukitimes){
  ドンッ！
% }
</p>
%= form_for '/' => begin
  %= submit_button '依頼ページヘ戻る'
%= end

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
