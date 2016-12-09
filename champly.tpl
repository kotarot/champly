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
    <title>Champly! 3x3x3 スクランブルジェネレータ for blders &hearts; {{ param.sitename }}</title>
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
    <meta property="og:title" content="Champly! 3x3x3 スクランブルジェネレータ for blders">
    <meta property="og:site_name" content="{{ param.sitename }}">
    <meta property="og:description" content="ルービックキューブ (3x3x3) 目隠し練習用のスクランブルを生成します。">
    <meta property="og:type" content="article">
    <meta property="og:url" content="{{ param.baseurl }}/champly">
    <meta property="og:image" content="{{ param.baseurl }}/champly.png">
  </head>
  <body>

    <header class="container pad-top bounceInUp animated">
      <div class="padded">
        <h1 class="zero">
          <img src="./champly.png" width="28" height="28"> Champly!
        </h1>
        <h2>3x3x3 スクランブルジェネレータ for blders</h2>
        <p class="pad-top">
          ルービックキューブ (3x3x3) 目隠し練習用のスクランブルを生成します。
        </p>
      </div>
      <!--<div class="pad-left pad-right">
        {{ param.breadcrumb }}
      </div>-->
    </header>

    <hr>

    <div class="container pad-top bounceInRight animated">
      <form id="inputs-form" action="http://cube.terabo.net/apis/chample-for-champly.jsonp" method="GET">
        <fieldset>
          <legend>Options</legend>
          <div class="row">
            <p class="option-label" style="margin-top: 0;">全体のオプション</p>
            <div class="one third">
              <label for="input-number">スクランブル数:</label>
              <input id="input-number" type="text" name="n" value="5">
            </div>
            <div class="one third">
              <label for="select-type">スクランブル種類:</label>
              <select id="select-type" class="unselected" name="t">
                <option value="0" selected="selected">完全ランダム</option>
                <option value="1">エッジのみ</option>
                <option value="2">コーナーのみ</option>
                <option value="3">詳細に設定する</option>
              </select>
            </div>
            <div class="one third"><span class="select-wrap" id="select-wrap-parity">
              <label for="select-parity">パリティ有無:</label>
              <select id="select-parity" class="unselected" name="p">
                <option value="r" selected="selected">パリティランダム</option>
                <option value="d">パリティ無し</option>
                <option value="e">パリティ有り</option>
              </select>
            </span></div>
          </div>
          <div class="row">
            <p class="option-label">エッジに関するオプション</p>
            <div class="one third">
              <label for="input-ef">揃っているエッジ数:</label>
              <input id="input-ef" type="number" name="ef" value="0" min="0" max="12">
            </div>
            <div class="one third">
              <label for="input-eo">EO数:</label>
              <input id="input-eo" type="number" name="eo" value="0" min="0" max="12">
            </div>
            <div class="one third"></div>
            <!--<div class="one fourth">
              <label for="input-er">ループ数:</label>
              <input id="input-er" type="number" name="er" value="1" min="1" max="6">
            </div>
            <div class="one fourth">
              <label for="input-em">最大ループ長:</label>
              <input id="input-em" type="number" name="em" value="2" min="2" max="12">
            </div>-->
          </div>
          <div class="row">
            <p class="option-label">コーナーに関するオプション</p>
            <div class="one third">
              <label for="input-cf">揃っているコーナー数:</label>
              <input id="input-cf" type="number" name="cf" value="0" min="0" max="8">
            </div>
            <div class="one third">
              <label for="input-co">CO数:</label>
              <input id="input-co" type="number" name="co" value="0" min="0" max="8">
            </div>
            <div class="one third"></div>
            <!--<div class="one fourth">
              <label for="input-cr">ループ数:</label>
              <input id="input-cr" type="number" name="cr" value="1">
            </div>
            <div class="one fourth">
              <label for="input-cm">最大ループ長:</label>
              <input id="input-cm" type="number" name="cm" value="0">
            </div>-->
          </div>
        </fieldset>
        <div id="inputs-error" class="pad-top animated" style="display:none">
          <p id="inputs-error-text" class="error message"></p>
        </div>
        <div id="inputs-error-2" class="pad-top animated" style="display:none">
          <p id="inputs-error-2-text" class="error message"></p>
        </div>
        <div class="double-padded">
          <button id="button-champly" type="submit" class="large block pink">Champly <i class="icon-heart"></i></button>
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
