@extends('layouts.guest')

@section('title', $setting->title)

@section('body_class', 'theme_havoc')

@section('content')
<ul class="home_breadcumb" style="padding: 30px 20px;">
    <li><a href="{{ route('home') }}" style="white-space: nowrap;">{{ $settingGeneral->title }}</a></li>
    <li><a href="{{ route('home') }}" style="white-space: nowrap;">{{ $setting->events_title }}</a></li>
    <li><a href="#" style="display: inline-block;
    max-width: 400px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    vertical-align: bottom;">{{ $post['title'] }}</a></li>
</ul>
<div class="post-page" style="padding: 10px 0px 20px 20px;">
    <h3 class="title">{{ $post['title'] }}</h3>
    <div class="publish_info">
        <div class="publish_by">Bởi  <span style="color: #fff; font-weight: 700;">Shaiya-Max</span>  - {{ $post['publish_at'] }}</div>
    </div>
    <div style="margin-bottom: 20px;">
        <img src="{{ $post->image->getUrl() }}">
    </div>
    <div>
        {!! html_entity_decode($post['content']) !!}
    </div>
</div>
@endsection
