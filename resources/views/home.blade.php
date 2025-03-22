@extends('layouts.guest')

@section('title', $setting->title)

@section('content')
{{--<link rel="stylesheet" href="https://shaiyarenegade.com/css/page_theme.css"></link>
<style>
	@charset "UTF-8";
	@import url(https://fonts.googleapis.com/css?family=Oswald:400,700);
	@import url(https://fonts.googleapis.com/css?family=Nunito:400,700);
@font-face {
  font-family: 'Genericons';
  src: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/genericons-regular-webfont.eot');
  src: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/genericons-regular-webfont.woff') format('woff'),
     url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/53819/genericons-regular-webfont.eot') format('truetype');
  font-weight: normal;
  font-style: normal;
}
    .main_content {
        margin-top: 30px !important;
    }
	.body_content {
		min-height: 100px !important;
	}
	:root {
	  background: -webkit-linear-gradient(top, #222838 0%, #131621 100%);
	  height: 100vh;
	}

	.main-container {
	  margin: 0 auto;
	  position: relative;
	  top: 0;
	  left: 0;
	  text-align: center;
	  right: 0;
		padding-left: 10px;    margin-top: -5px;

	}

	body
	{
	  background:#333;
	}
	a {
	  color: white;
	  text-decoration: none;
	}

	h1, h2 {
	  color: white;
	  font-family: 'Oswald', sans-serif;
	  font-weight: normal;
	}

	h2 {
	  font-size: 14px;
	  margin-bottom: 30px;
	  color: #24E2B8;
	}

	.one, .two, .three, .four, .five {
	  border: none;
	  border-radius: 4px;
	  text-shadow: 0px 0px 10px rgba(0, 0, 0, 0.48);
	  overflow: hidden;
	  padding: 20px 50px 20px 70px;
	  margin-top: 20px;
	  font-size: 20px;
	  position: relative;
	  color: white;
	  outline: none;
	  cursor: pointer;
	  -webkit-transition: background-position .7s,box-shadow .4s;
	  transition: background-position .7s,box-shadow .4s;
	  background-size: 110%;
	  font-family: 'Oswald', sans-serif;
	}
	.one:hover, .two:hover, .three:hover, .four:hover, .five:hover {
	  background-position: 0% 30%;
	}
	.one:hover:after, .two:hover:after, .three:hover:after, .four:hover:after, .five:hover:after {
	  right: -40px;
	  -webkit-transition: right .4s,-webkit-transform 30s .2s linear;
	  transition: right .4s,-webkit-transform 30s .2s linear;
	  transition: right .4s,transform 30s .2s linear;
	  transition: right .4s,transform 30s .2s linear,-webkit-transform 30s .2s linear;
	}
	.one:before, .two:before, .three:before, .four:before, .five:before, .one:after, .two:after, .three:after, .four:after, .five:after {
	  font-family: FontAwesome;
	  display: block;
	  position: absolute;
	}
	.one:before, .two:before, .three:before, .four:before, .five:before {
	  -webkit-transition: all 1s;
	  transition: all 1s;
	  font-size: 30px;
	  left: 25px;
	  top: 19px;
	}
	.one:after, .two:after, .three:after, .four:after, .five:after {
	  -webkit-transition: right .4s, -webkit-transform .2s;
	  transition: right .4s, -webkit-transform .2s;
	  transition: right .4s, transform .2s;
	  transition: right .4s, transform .2s, -webkit-transform .2s;
	  font-size: 100px;
	  opacity: .3;
	  right: -120px;
	  top: -17px;
	}

	.one {
	  box-shadow: 0px 0px 0px 2px rgba(255, 255, 255, 0.16) inset, 0px 0px 10px 0px #782CDA;
	  background-image: -webkit-gradient(linear, left top, left bottom, from(#782CDA), to(rgba(126, 94, 162, 0.51))), url("http://gearnuke.com/wp-content/uploads/2015/11/1280x720-cuU.jpg");
	  background-image: linear-gradient(to bottom, #782CDA, rgba(126, 94, 162, 0.51)), url("http://gearnuke.com/wp-content/uploads/2015/11/1280x720-cuU.jpg");
	}
	.one:hover {
	  box-shadow: 0px 0px 0px 2px rgba(255, 255, 255, 0.16) inset, 0px 0px 30px 0px #782CDA;
	}
	.one:hover:after {
	  -webkit-transform: scale(1);
			  transform: scale(1);
	}
	.one:hover:before {
	  -webkit-transform: scale(1.2);
			  transform: scale(1.2);
	}
	.one:after, .one:before {
	  content: "";
	}
	.one b {
	  color: #DDA6FF;
	  font-weight: 700;
	}

	.three {
	  box-shadow: 0px 0px 0px 2px rgba(255, 255, 255, 0.16) inset, 0px 0px 10px 0px #1648b1;
	  background-image: -webkit-gradient(linear, left top, left bottom, from(#1648b1), to(rgba(86, 202, 139, 0.18))), url("http://blog.teamthinklabs.com/wp-content/uploads/2012/09/codepen-460x253.png");
	  background-image: linear-gradient(to bottom, #1648b1, rgba(86, 202, 139, 0.18)), url("http://blog.teamthinklabs.com/wp-content/uploads/2012/09/codepen-460x253.png");
	}
	.three:hover {
	  box-shadow: 0px 0px 0px 2px rgba(255, 255, 255, 0.16) inset, 0px 0px 30px 0px #1648b1;
	}
	.three:hover:after {
	  -webkit-transform: scale(1);
			  transform: scale(1);
	}
	.three:hover:before {
	  -webkit-transform: scale(1.2);
			  transform: scale(1.2);
	}
	.three:after, .three:before {
	  content: "\f082";
	}
	.three b {
	  color: #63FFAC;
	  font-weight: 700;
	}

</style>
<div id="content_ajax" style="margin-top: 0px;">
    <!-- <div class="content_header border_box">
        <span>{{ $settingGeneral->title }} | <i>{{ $setting->header }}</i></span>
        <br><br>

        <div style="position:relative;width:96%;" class="nice_button">
            <div>
                <h4 style="font-weight: bold;color:#ff9900;">{{ $setting->events_title }}</h4>
                {!! html_entity_decode($setting->events_content) !!}
            </div><br>
        </div> <br><br>
        <div style="position:relative;width:96%;" class="nice_button">
            <div>
                <h4 style="font-weight: bold;color:#ff9900;">{{ $setting->announcement_title }}</h4>
                {!! html_entity_decode($setting->announcement_content) !!}
            </div><br>
        </div> <br><br>
        --}}{{--<table style="margin:20px auto 20px auto;">
                <tbody><tr><td><a class="nice_button" href="?p=1"><i class="fas fa-angle-double-left" aria-hidden="true"></i></a></td>

                    <td><a style="margin-left:5px;" class="nice_button nice_active" href="?page=">1</a></td>
                    <td><a style="margin-left:5px;" class="nice_button" href="?page=1"><i class="fas fa-angle-double-right" aria-hidden="true"></i></a></td>

                </tr>
                </tbody></table>--}}{{--
    </div> -->
	<div id="home_welcome" class="" style="">
		<div id="home_infor" class="sidebar border_box" style="float: left;
    width: 43%;padding: 0;">
			<section id="sidebox_status" class="sidebox" style="
    margin: 0 0 20px;
    width: 300px;
    position: relative;">
				<div id="downloadLink" style="

    background-image: url(/img/bg_btn_download.png);
    background-size: cover;
    height: 112px;
    background-repeat: no-repeat;
    display: inline;
    float: left;
    width: 314px;
    padding: 25px 30px;">
					<a href="{{ route('download') }}" title="Download" style="display: block;
    width: 225px;
    margin: -8px 0 0 12px;
    height: 34px;
    line-height: 24px;
    text-align: center;
    padding: 12px 0 14px;font-size: 22px;
    font-weight: bold;
    letter-spacing: -.1em;
    text-transform: uppercase;
    color: #21f56e;
}">
					<div id="downloadText" style="
    margin: 0;
    padding: 0;
    list-style: none;
    line-height: 1.5;
    font-weight: 600;">
						TẢI GAME
					</div>
					<div id="downloadPlayFree" style="
    margin: 0;
    padding: 0;
    list-style: none;
    font-weight: 600;">
						Miễn Phí
					</div></a>
				</div>
				<h4 class="sidebox_title border_box" style="
    padding: 0 15px;
    margin: 20px 0 0 0;
	top: 10px;
    height: 40px;
    overflow: hidden;
    background-image: url('https://shaiyarenegade.com/images/block-front-right.jpg');
	background-position: 0 0;
    line-height: 40px;
    font-size: 14px;
    text-transform: uppercase;">
					<i>{{ __('SERVER INFORMATION') }}</i>
					<div class="topvoter_desc" style="

    top: 10px;
    right: 15px;
    color: #605d57;
    position: absolute;
    font-size: 13px;
    font-weight: 700;
    text-shadow: 0 2px 0 rgba(0, 0, 0, .4);
    text-transform: uppercase;">
					<a href="{{ route('server-info') }}" style="
    color: #558be7;
    cursor: pointer;
    text-decoration: none;">view all</a></div>
				</h4>
				<div class="sidebox_body border_box" style="
    padding: 16px 0;
	top: 10px;
    margin: 0 0 0 0;
    background-image: url('https://shaiyarenegade.com/images/block-front-right.jpg');
    background-repeat: repeat-y;
    background-position: -300px 0;">
					<div id="realm_1" class="realm_1 realm_holder wotlk online lastrow" style="margin: 0;
    width: 100%;
    height: auto;
    display: block;">
						<div class="realm_row row-1 border_box" style="
    height: auto;
    margin: 0 0 5px;
    padding: 0 16px;
    display: block;">
							{!! html_entity_decode($settingHome->content_server_info) !!}
						</div>
					</div>
				</div>
				<div class="block-foot" style="
	margin: 0 0 0 0;
    background-image: url('/images/block-front-right.jpg');
    background-repeat: repeat-y;
    background-position: 0 6px;
    height: 10px;
    width: 300px;"></div>
			</section>

		</div>
		<div class="raw-html-embed" style="    float: right;
    width: 57%;">
			<div class='main-container'>
			  <button class='one'><a href="{{ $settingGeneral->url_discord }}"><b>DISCORD</b></a></button>
			  <button class='three'><a href="{{ $settingGeneral->url_facebook }}"><b>FACEBOOK</b></a></button>
			</div>
			<div id="intro-panel" style="

    width: 430px;
    overflow: hidden;
    margin-top: 23px;
    margin-left: -28px;
    margin-right: 0px;
    z-index: 1000;">
				<div class="block-body" id="intro-body" style="">
					<div class="block-content" id="intro-media" style="

    height: 340px;
    margin-left: 10px;
    padding: 18px 0 0;
    background-position: -200px 0;
    background-image: url(/images/intro-block.png);">
						<div id="mediaViewer" style="

    height: 250px;
    position: relative;
    z-index: 500;
    width: 380px;
    overflow: hidden;
    margin: 10px auto 3px;
    border-style: solid;
    border-color: #555;
    background-color: #000;
    background-image: -moz-linear-gradient(100% 100% 90deg, #333333, #000000);
    background-image: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#000000), to(#333333));
    border-width: 3px;">

							<iframe width="380px" style="" height="250px" src="https://www.youtube.com/embed/iG6u2sHO-4k" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</div>
	<div class="block-head" style=" */
    padding: 15px 25px 25px;
    position: relative;    text-transform: uppercase;
    line-height: 20px;
    background: url('/images/block-news.jpg');
    background-repeat: no-repeat;
    background-size: contain;
">
		<h2 class="title" style="
    font: bold 19px Arial, Helvetica;
    letter-spacing: -.015em;
    line-height: 29px;
    color: #bab9b9;
    text-shadow: 0 -1px 0 #000;">Tin tức</h2>
	</div>
	<div class="block-body" style="
	background: none !important;
	position: relative;
    margin-top: -30px;
    margin-bottom: 50px;
}
">
		<div class="block-content" style="
    padding: 5px 13px 13px;
    	background: none !important;position: relative;">
		@foreach ($articles as $article)
			<dl class="article" id="article-0" style="border: none !important;
    margin: 0px;">
				<dt class="subject" style="
    float: left;
    margin: 0;
    width: 800px;
    padding: 3px;
    border: none;
    letter-spacing: -.015em;
    font: bold 13px / 12px Arial, Helvetica;
}
    color: #ccc;
    vertical-align: baseline;"><a href="{{ route('post', ['id' => $article['id'] ]) }}" title="{{ $article['title'] }}" style="
    color: #c4c4c4;
}
    cursor: pointer;
    text-decoration: none;"><img src="/images/news.gif" border="0"> {{ $article['title'] }}</a></dt>

				<dd class="date" style="
    float: right;
    margin: 0;
	margin-right: -30px !important;

    display: inline;
    padding: 0 7px;
    text-transform: capitalize;
    font: 10px / 18px Verdana, Geneva, sans-serif;
    background: #222;"><span>{{ \Carbon\Carbon::parse($article['publish_at'])->format('d/m/Y') }}</span></dd>
				<dd style="
    clear: both;"></dd>
			</dl>
		@endforeach
		</div>
	</div>
</div>--}}
@endsection
