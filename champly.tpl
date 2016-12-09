<!DOCTYPE html><!--[if lt IE 7]><html lang="ja" class="no-js ie ie6 lt-ie7 lt-ie8 lt-ie9 lt-ie10" prefix="og: http://ogp.me/ns#"><![endif]-->
<!--[if IE 7]>   <html lang="ja" class="no-js ie ie7 lt-ie8 lt-ie9 lt-ie10" prefix="og: http://ogp.me/ns#"><![endif]-->
<!--[if IE 8]>   <html lang="ja" class="no-js ie ie8 lt-ie9 lt-ie10" prefix="og: http://ogp.me/ns#"><![endif]-->
<!--[if IE 9]>   <html lang="ja" class="no-js ie ie9 lt-ie10" prefix="og: http://ogp.me/ns#"><![endif]-->
<!--[if gt IE 9]><html lang="ja" class="no-js ie ie10" prefix="og: http://ogp.me/ns#"><![endif]-->
<!--[if !IE]><!-->
<html lang="ja" class="no-js" prefix="og: http://ogp.me/ns#"><!--<![endif]-->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <title>Champly! 3x3x3 スクランブルジェネレータ for BLDer &hearts; {{ param.sitename }}</title>
    <!-- Modernizr -->
    <script src="./js/libs/modernizr-2.6.2.min.js"></script>
    <!-- jQuery-->
    <script type="text/javascript" src="./js/libs/jquery-1.10.2.min.js"></script>
    <!-- framework css --><!--[if gt IE 9]><!-->
    <link type="text/css" rel="stylesheet" href="./css/groundwork.css"><!--<![endif]--><!--[if lte IE 9]>
    <link type="text/css" rel="stylesheet" href="./css/groundwork-core.css">
    <link type="text/css" rel="stylesheet" href="./css/groundwork-type.css">
    <link type="text/css" rel="stylesheet" href="./css/groundwork-ui.css">
    <link type="text/css" rel="stylesheet" href="./css/groundwork-anim.css">
    <link type="text/css" rel="stylesheet" href="./css/groundwork-ie.css"><![endif]-->
    <link type="text/css" rel="stylesheet" href="./champly.css">
    <meta property="og:locale" content="ja_JP">
    <meta property="og:title" content="Champly! 3x3x3 スクランブルジェネレータ for BLDer">
    <meta property="og:site_name" content="{{ param.sitename }}">
    <meta property="og:description" content="ルービックキューブ (3x3x3) 目隠し練習用のスクランブルを生成します。">
    <meta property="og:type" content="article">
    <meta property="og:url" content="{{ param.baseurl }}/champly">
    <meta property="og:image" content="{{ param.baseurl }}/champly.png">
  </head>
  <body>

    <header class="container pad-top bounceInUp animated">
      <div class="padded">
        <h1 class="zero">Champly!</h1>
        <h2>&mdash; 3x3x3 スクランブルジェネレータ for BLDer &mdash;</h2>
        <p class="pad-top">
          ルービックキューブ (3x3x3) 目隠し練習用のスクランブルを生成します。
        </p>
      </div>
      <div class="pad-left pad-right">
        {{ param.breadcrumb }}
      </div>
    </header>

    <hr>

    <div class="container pad-top bounceInRight animated">
      <form id="inputs-form" action="http://cube.terabo.net/apis/chample-for-champly.jsonp" method="GET">
        <fieldset>
          <legend>Inputs</legend>
          <div class="row">
            <div class="one half pad-left pad-right">
              <label for="input-number">スクランブル数:</label>
              <input id="input-number" type="text" name="n" value="5">
            </div>
            <div class="one half pad-left pad-right"><span class="select-wrap">
              <label for="select-type">スクランブル種類:</label>
              <select id="select-type" class="unselected" name="t">
                <option value="0" selected="selected">通常</option>
                <option value="1">コーナーのみ</option>
                <option value="2">エッジのみ</option>
                <option value="4">パリティ無し</option>
                <option value="3">パリティ有り</option>
              </select>
            </span></div>
          </div>
        </fieldset>
        <div id="inputs-error" class="pad-top animated" style="display:none">
          <p id="inputs-error-text" class="error message"></p>
        </div>
        <div class="double-padded">
          <button id="button-champly" type="submit" class="large block asphalt">Champly!</button>
        </div>
      </form>
    </div><!-- /.container -->

    <div id="results-loading" class="container animated" style="display:none;">
      <p class="box box-loading">
        <i class="icon-spinner icon-spin"></i> スクランブル取得中......
      </p>
    </div><!-- /.container -->

    <div id="results-error" class="container animated" style="display:none;">
      <p class="error message">スクランブルの取得に失敗しました。</p>
    </div><!-- /.container -->

    <div id="results" class="container animated" style="display:none;">
      <table id="results-table" class="responsive" data-max="100">
        <thead>
          <tr>
            <th class="idx">#</th>
            <th class="scramble">Scramble sequence</th>
          </tr>
        </thead>
        <tbody id="results-tbody">
        </tbody>
      </table>
      <div class="double-padded">
        <button id="button-copy" class="block" style="font-weight:normal;">
          <i class="icon-copy"></i> コピー用テキストを表示する
        </button>
      </div>
      <textarea id="results-text" style="display:none;"></textarea>
    </div><!-- /.container -->

    <footer class="bounceInUp animated">
      <div class="box square charcoal">
        <div class="container padded">
          <p>
            <a href="https://github.com/kotarot/champly" target="_blank"><b>Champly! project</b></a>:
            Feel free to star it, fork it, send a bug report, or send a pull request!
          </p>
        </div>
      </div>
    </footer>

    <!-- javascript-->
    <script type="text/javascript" src="./js/groundwork.all.js"></script>
    <script type="text/javascript" src="./champly.js"></script>

    <!-- google analytics-->
    <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', '{{ param.ga }}']);
      _gaq.push(['_trackPageview']);
      (function() {
      var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
      ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>

  </body>
</html>
