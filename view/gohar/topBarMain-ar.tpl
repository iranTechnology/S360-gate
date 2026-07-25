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
          href="https://online.safaryartravel.com/gds/view/gohar/project_files/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://online.safaryartravel.com/gds/view/gohar/project_files/css/style.css">
    <link rel="stylesheet" type="text/css"
          href="https://online.safaryartravel.com/gds/view/gohar/project_files/css/header.css">
    <link rel="stylesheet" type="text/css"
          href="https://online.safaryartravel.com/gds/view/gohar/project_files/css/tabs.css">
    <link rel="stylesheet" type="text/css"
          href="https://online.safaryartravel.com/gds/view/gohar/project_files/css/all.css">
    <style>
        body {
            background: none !important;
            padding: 0;
            margin: 0;
        }

    </style>
</head>
<body>

{include file="`$smarty.const.FRONT_THEMES_DIR`gohar/topBar-ar.tpl"}
{literal}
    <script type="text/javascript" src="project_files/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">

        function signout() {
            $.post('http://online.safaryartravel.com/gds/user_ajax.php',
                {flag: 'signout'},
                function (data) {
                    window.top.location.href = "http://www.safaryartravel.com/fa/user/home.php";
                }
            )
        }
    </script>
{/literal}
</body>

</html>
