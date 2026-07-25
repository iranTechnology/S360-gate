{load_presentation_object filename="Session" assign="objSession"}
{load_presentation_object filename="functions" assign="objFunctions"}
{load_presentation_object filename="dateTimeSetting" assign="objDate"}
<!doctype html>
<html style="overflow-x: hidden" lang="fa">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css"
          href="http://online.go-pls.com/gds/view/barakat/project_files/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="http://online.go-pls.com/gds/view/barakat/project_files/css/style.css">
    <link rel="stylesheet" type="text/css"
          href="http://online.go-pls.com/gds/view/barakat/project_files/css/responsive.css">
    <style>
        body {
            background: none !important;
            padding: 0px;
            margin: 0px;
        }
    </style>
</head>
<body>

{include file="`$smarty.const.FRONT_THEMES_DIR`barakat/topBar.tpl"}
{literal}
    <script type="text/javascript" src="http://www.go-pls.com/ar/user/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript">

        function signout() {
            $.post('http://online.go-pls.com/gds/user_ajax.php',
                {flag: 'signout'},
                function (data) {
                    window.top.location.href = "http://www.go-pls.com/ar/user/home.php";
                }
            )
        }
    </script>
{/literal}
</body>

</html>
