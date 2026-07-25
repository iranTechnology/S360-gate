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
          href="https://online.oshidaparvazco.ir/gds/view/oshida/project_files/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://online.oshidaparvazco.ir/gds/view/oshida/project_files/css/style.css">

    <style>
        body {
            background: none !important;
            padding: 0px;
            margin: 0px;
        }
    </style>
</head>
<body>

{include file="`$smarty.const.FRONT_THEMES_DIR`oshida/topBar.tpl"}
{literal}
    <script type="text/javascript" src="http://www.oshidaparvazco.ir/fa/user/js/jquery.js"></script>
    <script type="text/javascript">

        function signout() {
            $.post('https://online.oshidaparvazco.ir/gds/user_ajax.php',
                {flag: 'signout'},
                function (data) {
                    window.top.location.href = "https://oshidaparvazco.ir";
                }
            )
        }
    </script>
{/literal}
</body>

</html>
