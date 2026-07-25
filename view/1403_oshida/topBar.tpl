

<style>


    body {

        padding:0px;
        margin:0px;

        direction: rtl;

    }
    .top_bar_inner{ padding: 8px 0; }
    i.svg-icon {
        width: 17px;
        height: 17px;
        position: relative;
        right: 0px;
        top: 0px;
        bottom: 0px;
        margin: auto;
    }

    .user_box a{
        color: white;
    }
    i.svg-icon svg {
        width: 17px;
        height: 17px;
        fill: #ffffff;
    }

    .top-bar {
        padding: 8px 13px;

        color: #fff;
        font-size: 13px;
    }

    .top-bar a {
        color: #fff;
        position: relative;
        text-decoration: none;
        margin-right: 0px;
        border-left: 1px solid #fff;
        padding-left: 20px;
    }

    .no-border {
        border: none !important;
    }

    .top-bar-inner {
        display: flex;
        max-width: 100%;
    }

    .top-bar-inner .tell {
        margin-right: auto;
    }

    .top-bar-inner .tell a, .top-bar-inner .tell span {
        font-family: persian-number;
        /*! background-image: url(data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgNDgyLjYgNDgyLjYiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQ4Mi42IDQ4Mi42OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjUxMiIgaGVpZ2h0PSI1MTIiIGNsYXNzPSIiPjxnPjxnPgoJPHBhdGggZD0iTTk4LjMzOSwzMjAuOGM0Ny42LDU2LjksMTA0LjksMTAxLjcsMTcwLjMsMTMzLjRjMjQuOSwxMS44LDU4LjIsMjUuOCw5NS4zLDI4LjJjMi4zLDAuMSw0LjUsMC4yLDYuOCwwLjIgICBjMjQuOSwwLDQ0LjktOC42LDYxLjItMjYuM2MwLjEtMC4xLDAuMy0wLjMsMC40LTAuNWM1LjgtNywxMi40LTEzLjMsMTkuMy0yMGM0LjctNC41LDkuNS05LjIsMTQuMS0xNCAgIGMyMS4zLTIyLjIsMjEuMy01MC40LTAuMi03MS45bC02MC4xLTYwLjFjLTEwLjItMTAuNi0yMi40LTE2LjItMzUuMi0xNi4yYy0xMi44LDAtMjUuMSw1LjYtMzUuNiwxNi4xbC0zNS44LDM1LjggICBjLTMuMy0xLjktNi43LTMuNi05LjktNS4yYy00LTItNy43LTMuOS0xMS02Yy0zMi42LTIwLjctNjIuMi00Ny43LTkwLjUtODIuNGMtMTQuMy0xOC4xLTIzLjktMzMuMy0zMC42LTQ4LjggICBjOS40LTguNSwxOC4yLTE3LjQsMjYuNy0yNi4xYzMtMy4xLDYuMS02LjIsOS4yLTkuM2MxMC44LTEwLjgsMTYuNi0yMy4zLDE2LjYtMzZzLTUuNy0yNS4yLTE2LjYtMzZsLTI5LjgtMjkuOCAgIGMtMy41LTMuNS02LjgtNi45LTEwLjItMTAuNGMtNi42LTYuOC0xMy41LTEzLjgtMjAuMy0yMC4xYy0xMC4zLTEwLjEtMjIuNC0xNS40LTM1LjItMTUuNGMtMTIuNywwLTI0LjksNS4zLTM1LjYsMTUuNWwtMzcuNCwzNy40ICAgYy0xMy42LDEzLjYtMjEuMywzMC4xLTIyLjksNDkuMmMtMS45LDIzLjksMi41LDQ5LjMsMTMuOSw4MEMzMi43MzksMjI5LjYsNTkuMTM5LDI3My43LDk4LjMzOSwzMjAuOHogTTI1LjczOSwxMDQuMiAgIGMxLjItMTMuMyw2LjMtMjQuNCwxNS45LTM0bDM3LjItMzcuMmM1LjgtNS42LDEyLjItOC41LDE4LjQtOC41YzYuMSwwLDEyLjMsMi45LDE4LDguN2M2LjcsNi4yLDEzLDEyLjcsMTkuOCwxOS42ICAgYzMuNCwzLjUsNi45LDcsMTAuNCwxMC42bDI5LjgsMjkuOGM2LjIsNi4yLDkuNCwxMi41LDkuNCwxOC43cy0zLjIsMTIuNS05LjQsMTguN2MtMy4xLDMuMS02LjIsNi4zLTkuMyw5LjQgICBjLTkuMyw5LjQtMTgsMTguMy0yNy42LDI2LjhjLTAuMiwwLjItMC4zLDAuMy0wLjUsMC41Yy04LjMsOC4zLTcsMTYuMi01LDIyLjJjMC4xLDAuMywwLjIsMC41LDAuMywwLjggICBjNy43LDE4LjUsMTguNCwzNi4xLDM1LjEsNTcuMWMzMCwzNyw2MS42LDY1LjcsOTYuNCw4Ny44YzQuMywyLjgsOC45LDUsMTMuMiw3LjJjNCwyLDcuNywzLjksMTEsNmMwLjQsMC4yLDAuNywwLjQsMS4xLDAuNiAgIGMzLjMsMS43LDYuNSwyLjUsOS43LDIuNWM4LDAsMTMuMi01LjEsMTQuOS02LjhsMzcuNC0zNy40YzUuOC01LjgsMTIuMS04LjksMTguMy04LjljNy42LDAsMTMuOCw0LjcsMTcuNyw4LjlsNjAuMyw2MC4yICAgYzEyLDEyLDExLjksMjUtMC4zLDM3LjdjLTQuMiw0LjUtOC42LDguOC0xMy4zLDEzLjNjLTcsNi44LTE0LjMsMTMuOC0yMC45LDIxLjdjLTExLjUsMTIuNC0yNS4yLDE4LjItNDIuOSwxOC4yICAgYy0xLjcsMC0zLjUtMC4xLTUuMi0wLjJjLTMyLjgtMi4xLTYzLjMtMTQuOS04Ni4yLTI1LjhjLTYyLjItMzAuMS0xMTYuOC03Mi44LTE2Mi4xLTEyN2MtMzcuMy00NC45LTYyLjQtODYuNy03OS0xMzEuNSAgIEMyOC4wMzksMTQ2LjQsMjQuMTM5LDEyNC4zLDI1LjczOSwxMDQuMnoiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIGNsYXNzPSJhY3RpdmUtcGF0aCIgc3R5bGU9ImZpbGw6I0ZGRkZGRiIgZGF0YS1vbGRfY29sb3I9IiMwMDAwMDAiPjwvcGF0aD4KPC9nPjwvZz4gPC9zdmc+); */
        padding-left: 8px;
        background-size: 17px;
        background-position: right center;
        background-repeat: no-repeat;
        position: relative;
        color: #fff;
    }

    .top-bar-inner .logedin-links {
        margin-right: auto;
        display: flex;
    }

    .top-bar-inner .logedin-links div {
        margin: 0px 10px;
        display: flex;
        align-items: center;
    }

    .top-bar-inner .logedin-links div a {

        padding-right: 22px;
        background-repeat: no-repeat;
        background-size: 17px;
        min-height: 17px;
        background-position: right center;
    }

    .top-bar-inner .logedin-links div:first-child a {
        background-image: url(data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTIiIGhlaWdodD0iNTEyIiBjbGFzcz0iIj48Zz48Zz4KCTxnPgoJCTxwYXRoIGQ9Ik00MzcuMDIsMzMwLjk4Yy0yNy44ODMtMjcuODgyLTYxLjA3MS00OC41MjMtOTcuMjgxLTYxLjAxOEMzNzguNTIxLDI0My4yNTEsNDA0LDE5OC41NDgsNDA0LDE0OCAgICBDNDA0LDY2LjM5MywzMzcuNjA3LDAsMjU2LDBTMTA4LDY2LjM5MywxMDgsMTQ4YzAsNTAuNTQ4LDI1LjQ3OSw5NS4yNTEsNjQuMjYyLDEyMS45NjIgICAgYy0zNi4yMSwxMi40OTUtNjkuMzk4LDMzLjEzNi05Ny4yODEsNjEuMDE4QzI2LjYyOSwzNzkuMzMzLDAsNDQzLjYyLDAsNTEyaDQwYzAtMTE5LjEwMyw5Ni44OTctMjE2LDIxNi0yMTZzMjE2LDk2Ljg5NywyMTYsMjE2ICAgIGg0MEM1MTIsNDQzLjYyLDQ4NS4zNzEsMzc5LjMzMyw0MzcuMDIsMzMwLjk4eiBNMjU2LDI1NmMtNTkuNTUxLDAtMTA4LTQ4LjQ0OC0xMDgtMTA4UzE5Ni40NDksNDAsMjU2LDQwICAgIGM1OS41NTEsMCwxMDgsNDguNDQ4LDEwOCwxMDhTMzE1LjU1MSwyNTYsMjU2LDI1NnoiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIGNsYXNzPSJhY3RpdmUtcGF0aCIgc3R5bGU9ImZpbGw6I0ZGRkZGRiIgZGF0YS1vbGRfY29sb3I9IiMwMDAwMDAiPjwvcGF0aD4KCTwvZz4KPC9nPjwvZz4gPC9zdmc+);
    }

    .top-bar-inner .logedin-links div:last-child a {
        background-image: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAtMTAgNDkwLjY2NjY3IDQ5MCIgd2lkdGg9IjUxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBjbGFzcz0iIj48Zz48cGF0aCBkPSJtNDc0LjY2Nzk2OSAyNTFoLTMwOS4zMzU5MzhjLTguODMyMDMxIDAtMTYtNy4xNjc5NjktMTYtMTZzNy4xNjc5NjktMTYgMTYtMTZoMzA5LjMzNTkzOGM4LjgzMjAzMSAwIDE2IDcuMTY3OTY5IDE2IDE2cy03LjE2Nzk2OSAxNi0xNiAxNnptMCAwIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBjbGFzcz0iYWN0aXZlLXBhdGgiIHN0eWxlPSJmaWxsOiNGRkZGRkYiIGRhdGEtb2xkX2NvbG9yPSIjMDAwMDAwIj48L3BhdGg+PHBhdGggZD0ibTI1MC42Njc5NjkgMzM2LjMzMjAzMWMtNC4wOTc2NTcgMC04LjE5MTQwNy0xLjU1NDY4Ny0xMS4zMDg1OTQtNC42OTE0MDZsLTg1LjMzMjAzMS04NS4zMzIwMzFjLTYuMjUtNi4yNTM5MDYtNi4yNS0xNi4zODY3MTkgMC0yMi42MzY3MTlsODUuMzMyMDMxLTg1LjMzMjAzMWM2LjI1LTYuMjUgMTYuMzgyODEzLTYuMjUgMjIuNjM2NzE5IDAgNi4yNSA2LjI1IDYuMjUgMTYuMzgyODEyIDAgMjIuNjMyODEybC03NC4wMjczNDQgNzQuMDI3MzQ0IDc0LjAyNzM0NCA3NC4wMjczNDRjNi4yNSA2LjI1IDYuMjUgMTYuMzgyODEyIDAgMjIuNjMyODEyLTMuMTM2NzE5IDMuMTE3MTg4LTcuMjM0Mzc1IDQuNjcxODc1LTExLjMyODEyNSA0LjY3MTg3NXptMCAwIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBjbGFzcz0iYWN0aXZlLXBhdGgiIHN0eWxlPSJmaWxsOiNGRkZGRkYiIGRhdGEtb2xkX2NvbG9yPSIjMDAwMDAwIj48L3BhdGg+PHBhdGggZD0ibTIzNC42Njc5NjkgNDY5LjY2Nzk2OWMtMTI5LjM4NjcxOSAwLTIzNC42Njc5NjktMTA1LjI4MTI1LTIzNC42Njc5NjktMjM0LjY2Nzk2OXMxMDUuMjgxMjUtMjM0LjY2Nzk2OSAyMzQuNjY3OTY5LTIzNC42Njc5NjljOTcuMDg1OTM3IDAgMTgyLjgwNDY4NyA1OC40MTAxNTcgMjE4LjQxMDE1NiAxNDguODI0MjE5IDMuMjQyMTg3IDguMjEwOTM4LS44MTI1IDE3LjQ5MjE4OC05LjAyMzQzNyAyMC43NTM5MDYtOC4yMTQ4NDQgMy4yMDMxMjUtMTcuNDk2MDk0LS43ODkwNjItMjAuNzU3ODEzLTkuMDQyOTY4LTMwLjc0MjE4Ny03OC4wODIwMzItMTA0Ljc4OTA2My0xMjguNTM1MTU3LTE4OC42Mjg5MDYtMTI4LjUzNTE1Ny0xMTEuNzQ2MDk0IDAtMjAyLjY2Nzk2OSA5MC45MjU3ODEtMjAyLjY2Nzk2OSAyMDIuNjY3OTY5czkwLjkyMTg3NSAyMDIuNjY3OTY5IDIwMi42Njc5NjkgMjAyLjY2Nzk2OWM4My44Mzk4NDMgMCAxNTcuODg2NzE5LTUwLjQ1MzEyNSAxODguNjI4OTA2LTEyOC41MTE3MTkgMy4yNDIxODctOC4yNTc4MTIgMTIuNTIzNDM3LTEyLjI0NjA5NCAyMC43NTc4MTMtOS4wNDY4NzUgOC4yMTA5MzcgMy4yNDIxODcgMTIuMjY1NjI0IDEyLjU0Mjk2OSA5LjAyMzQzNyAyMC43NTc4MTMtMzUuNjA1NDY5IDkwLjM5MDYyNC0xMjEuMzI0MjE5IDE0OC44MDA3ODEtMjE4LjQxMDE1NiAxNDguODAwNzgxem0wIDAiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIGNsYXNzPSJhY3RpdmUtcGF0aCIgc3R5bGU9ImZpbGw6I0ZGRkZGRiIgZGF0YS1vbGRfY29sb3I9IiMwMDAwMDAiPjwvcGF0aD48L2c+IDwvc3ZnPg==);
    }

    .top-bar-inner .logedin-links div:last-child {
        margin-left: 0px;
        padding-right: 20px;
        border-right: 1px solid #fff;
    }

    .top-bar-inner .loged-in span:first-child {
        margin-left: 2px;
        font-size: 13px;
    }

    .top-bar-inner .loged-in span:last-child {
        font-size: 12px;
        opacity: 0.8;
    }

    .top-bar-inner .loged-in span:last-child i {
        font-style: normal;
    }

    .top-bar-inner .login-register {
        display: flex;
        margin: 0;
    }

    .user_box div {
        position: relative;
        display: inline-block;
        padding-right: 25px;

    }

    .top_bar_inner a {
        font-size: 12px !important;
        color: #fff !important;
        font-family: persian-number !important;
        font-weight: normal;
        float: right;
    }


    .top-bar-inner .login-register > div {
        margin: 0 10px;
    }

    .top-bar-inner .login-register > div > a {
        padding-right: 22px;
        background-size: 17px;
        background-repeat: no-repeat;
        background-position: right center;
    }

    .top-bar-inner .login-register > div.login a {
        /*! background-image: url(data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjUxMiIgdmlld0JveD0iMCAtMTAgNDkwLjY2NjY3IDQ5MCIgd2lkdGg9IjUxMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48Zz48cGF0aCBkPSJtMzI1LjMzMjAzMSAyNTFoLTMwOS4zMzIwMzFjLTguODMyMDMxIDAtMTYtNy4xNjc5NjktMTYtMTZzNy4xNjc5NjktMTYgMTYtMTZoMzA5LjMzMjAzMWM4LjgzMjAzMSAwIDE2IDcuMTY3OTY5IDE2IDE2cy03LjE2Nzk2OSAxNi0xNiAxNnptMCAwIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBjbGFzcz0iYWN0aXZlLXBhdGgiIHN0eWxlPSJmaWxsOiNGRkZGRkYiIGRhdGEtb2xkX2NvbG9yPSIjMDAwMDAwIj48L3BhdGg+PHBhdGggZD0ibTI0MCAzMzYuMzMyMDMxYy00LjA5NzY1NiAwLTguMTkxNDA2LTEuNTU0Njg3LTExLjMwODU5NC00LjY5MTQwNi02LjI1LTYuMjUtNi4yNS0xNi4zODI4MTMgMC0yMi42MzY3MTlsNzQuMDI3MzQ0LTc0LjAyMzQzNy03NC4wMjczNDQtNzQuMDI3MzQ0Yy02LjI1LTYuMjUtNi4yNS0xNi4zODY3MTkgMC0yMi42MzY3MTkgNi4yNTM5MDYtNi4yNSAxNi4zODY3MTktNi4yNSAyMi42MzY3MTkgMGw4NS4zMzIwMzEgODUuMzM1OTM4YzYuMjUgNi4yNSA2LjI1IDE2LjM4MjgxMiAwIDIyLjYzMjgxMmwtODUuMzMyMDMxIDg1LjMzMjAzMmMtMy4xMzY3MTkgMy4xNjAxNTYtNy4yMzA0NjkgNC43MTQ4NDMtMTEuMzI4MTI1IDQuNzE0ODQzem0wIDAiIGRhdGEtb3JpZ2luYWw9IiMwMDAwMDAiIGNsYXNzPSJhY3RpdmUtcGF0aCIgc3R5bGU9ImZpbGw6I0ZGRkZGRiIgZGF0YS1vbGRfY29sb3I9IiMwMDAwMDAiPjwvcGF0aD48cGF0aCBkPSJtMjU2IDQ2OS42Njc5NjljLTk3LjA4OTg0NCAwLTE4Mi44MDQ2ODgtNTguNDEwMTU3LTIxOC40MTAxNTYtMTQ4LjgyNDIxOS0zLjI0MjE4OC04LjE5MTQwNi44MDg1OTQtMTcuNDkyMTg4IDkuMDIzNDM3LTIwLjczNDM3NSA4LjE5MTQwNy0zLjE5OTIxOSAxNy41MTU2MjUuNzg5MDYzIDIwLjc1NzgxMyA5LjA0Njg3NSAzMC43NDIxODcgNzguMDU4NTk0IDEwNC43ODkwNjIgMTI4LjUxMTcxOSAxODguNjI4OTA2IDEyOC41MTE3MTkgMTExLjc0MjE4OCAwIDIwMi42Njc5NjktOTAuOTI1NzgxIDIwMi42Njc5NjktMjAyLjY2Nzk2OXMtOTAuOTI1NzgxLTIwMi42Njc5NjktMjAyLjY2Nzk2OS0yMDIuNjY3OTY5Yy04My44Mzk4NDQgMC0xNTcuODg2NzE5IDUwLjQ1MzEyNS0xODguNjI4OTA2IDEyOC41MTE3MTktMy4yNjU2MjUgOC4yNTc4MTItMTIuNTY2NDA2IDEyLjI0NjA5NC0yMC43NTc4MTMgOS4wNDY4NzUtOC4yMTQ4NDMtMy4yNDIxODctMTIuMjY1NjI1LTEyLjU0Mjk2OS05LjAyMzQzNy0yMC43MzQzNzUgMzUuNjA1NDY4LTkwLjQxNDA2MiAxMjEuMzIwMzEyLTE0OC44MjQyMTkgMjE4LjQxMDE1Ni0xNDguODI0MjE5IDEyOS4zODY3MTkgMCAyMzQuNjY3OTY5IDEwNS4yODEyNSAyMzQuNjY3OTY5IDIzNC42Njc5NjlzLTEwNS4yODEyNSAyMzQuNjY3OTY5LTIzNC42Njc5NjkgMjM0LjY2Nzk2OXptMCAwIiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBjbGFzcz0iYWN0aXZlLXBhdGgiIHN0eWxlPSJmaWxsOiNGRkZGRkYiIGRhdGEtb2xkX2NvbG9yPSIjMDAwMDAwIj48L3BhdGg+PC9nPiA8L3N2Zz4=); */
    }

    .top-bar-inner .login-register > div.register a {
        /*! background-image: url(data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJDYXBhXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgNTEyIDUxMiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTEyIDUxMjsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTIiIGhlaWdodD0iNTEyIiBjbGFzcz0iIj48Zz48Zz4KCTxnPgoJCTxwYXRoIGQ9Ik0zNjcuNTcsMjU2LjkwOWMtOS44MzktNC42NzctMTkuODc4LTguNzA2LTMwLjA5My0xMi4wODFDMzcwLjU2LDIxOS45OTYsMzkyLDE4MC40NTUsMzkyLDEzNkMzOTIsNjEuMDEsMzMwLjk5MSwwLDI1NiwwICAgIGMtNzQuOTkxLDAtMTM2LDYxLjAxLTEzNiwxMzZjMCw0NC41MDQsMjEuNDg4LDg0LjA4NCw1NC42MzMsMTA4LjkxMWMtMzAuMzY4LDkuOTk4LTU4Ljg2MywyNS41NTUtODMuODAzLDQ2LjA2OSAgICBjLTQ1LjczMiwzNy42MTctNzcuNTI5LDkwLjA4Ni04OS41MzIsMTQ3Ljc0M2MtMy43NjIsMTguMDY2LDAuNzQ1LDM2LjYyMiwxMi4zNjMsNTAuOTA4QzI1LjIyMiw1MDMuODQ3LDQyLjM2NSw1MTIsNjAuNjkzLDUxMiAgICBIMzA3YzExLjA0NiwwLDIwLTguOTU0LDIwLTIwYzAtMTEuMDQ2LTguOTU0LTIwLTIwLTIwSDYwLjY5M2MtOC41MzgsMC0xMy42ODktNC43NjYtMTUuOTk5LTcuNjA2ICAgIGMtMy45ODktNC45MDUtNS41MzMtMTEuMjktNC4yMzYtMTcuNTE5YzIwLjc1NS05OS42OTUsMTA4LjY5MS0xNzIuNTIxLDIxMC4yNC0xNzQuOTc3YzEuNzU5LDAuMDY4LDMuNTI2LDAuMTAyLDUuMzAyLDAuMTAyICAgIGMxLjc5MywwLDMuNTc4LTAuMDM1LDUuMzU0LTAuMTA0YzMxLjEyLDAuNzMsNjEuMDUsNy44MzIsODkuMDQ0LDIxLjE0YzkuOTc3LDQuNzQsMjEuOTA3LDAuNDk5LDI2LjY0OS05LjQ3OCAgICBDMzgxLjc4OSwyNzMuNTgyLDM3Ny41NDcsMjYxLjY1MSwzNjcuNTcsMjU2LjkwOXogTTI2MC44NzgsMjMxLjg3N2MtMS42MjMtMC4wMjktMy4yNDktMC4wNDQtNC44NzgtMC4wNDQgICAgYy0xLjYxNCwwLTMuMjI4LDAuMDE2LTQuODQsMC4wNDZDMjAwLjQ2NSwyMjkuMzUsMTYwLDE4Ny4zMTIsMTYwLDEzNmMwLTUyLjkzNSw0My4wNjUtOTYsOTYtOTZzOTYsNDMuMDY1LDk2LDk2ICAgIEMzNTIsMTg3LjI5OSwzMTEuNTU1LDIyOS4zMjksMjYwLjg3OCwyMzEuODc3eiIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgY2xhc3M9ImFjdGl2ZS1wYXRoIiBzdHlsZT0iZmlsbDojRkZGRkZGIiBkYXRhLW9sZF9jb2xvcj0iIzAwMDAwMCI+PC9wYXRoPgoJPC9nPgo8L2c+PGc+Cgk8Zz4KCQk8cGF0aCBkPSJNNDkyLDM5N2gtNTV2LTU1YzAtMTEuMDQ2LTguOTU0LTIwLTIwLTIwYy0xMS4wNDYsMC0yMCw4Ljk1NC0yMCwyMHY1NWgtNTVjLTExLjA0NiwwLTIwLDguOTU0LTIwLDIwICAgIGMwLDExLjA0Niw4Ljk1NCwyMCwyMCwyMGg1NXY1NWMwLDExLjA0Niw4Ljk1NCwyMCwyMCwyMGMxMS4wNDYsMCwyMC04Ljk1NCwyMC0yMHYtNTVoNTVjMTEuMDQ2LDAsMjAtOC45NTQsMjAtMjAgICAgQzUxMiw0MDUuOTU0LDUwMy4wNDYsMzk3LDQ5MiwzOTd6IiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBjbGFzcz0iYWN0aXZlLXBhdGgiIHN0eWxlPSJmaWxsOiNGRkZGRkYiIGRhdGEtb2xkX2NvbG9yPSIjMDAwMDAwIj48L3BhdGg+Cgk8L2c+CjwvZz48L2c+IDwvc3ZnPg==); */
    }

    .top-bar-inner .login-register .login {
        margin-right: 0px;

        border-left: 1px solid #fff;
        padding-left: 20px;

    }

    @media (max-width: 576px) {
        .top-bar-inner .loged-in span:last-child {
            display: block;
        }

    }

    @media (max-width: 760px) {

        .phone {
            display: none !important;
        }
    }
    @media( max-width: 400px){
        .logined-links{ display: none;
        }
        @media (max-width: 430px) {

            .top-bar-inner {
                flex-wrap: wrap;
            }

            .top-bar-inner .logedin-links div:first-child {
                margin-right: 0px;
            }

            .top-bar-inner .loged-in {
                flex: 0 0 100%;
                justify-content: center;
                justify-items: center;
                text-align: center;
                margin-bottom: 10px;
            }

            .top-bar-inner .logedin-links {
                flex: 0 0 100%;
                justify-content: center;
            }

            .top-bar-inner .loged-in span:last-child {
                display: inline-block !important;
            }
        }

        @media (max-width: 350px) {
            .top-bar, .top-bar * {
                font-size: 11px
            }

            .top-bar-inner .loged-in span *, .top-bar-inner .loged-in span {

                font-size: 11px;
            }

            .top-bar-inner .login-register > div > a, .top-bar-inner .logedin-links div a, .top-bar-inner .tell span {
                background-size: 15px;
            }
        }

        .social_header ul {
            margin-top: 5px;
        }

        .social_header {
            flex: 0 0 200px;
        }

        .social_header li {
            display: inline-block
        }

        .social_header li {
            padding: 0 5px;
        }
        .top_bar_inner{
            width: 100%;
            margin-top: 10px;
            padding-right: 15px;
            padding-left: 15px;
        }



</style>

<div class="header-top">
    <div class="container">
        <div class="header-top-inner  {if $objSession->IsLogin() } logined {/if}">


            <div class="user_box ml-auto">
                {if $objSession->IsLogin() }
                    <div class='parent-box-profile'>
                        <div class="user_box_profile">
                            <a target="_parent" href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                                <i class="svg-icon">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" viewBox="0 0 482.9 482.9" style="enable-background:new 0 0 482.9 482.9;" xml:space="preserve" ><g><g>
                                                <g>
                                                    <path d="M239.7,260.2c0.5,0,1,0,1.6,0c0.2,0,0.4,0,0.6,0c0.3,0,0.7,0,1,0c29.3-0.5,53-10.8,70.5-30.5    c38.5-43.4,32.1-117.8,31.4-124.9c-2.5-53.3-27.7-78.8-48.5-90.7C280.8,5.2,262.7,0.4,242.5,0h-0.7c-0.1,0-0.3,0-0.4,0h-0.6    c-11.1,0-32.9,1.8-53.8,13.7c-21,11.9-46.6,37.4-49.1,91.1c-0.7,7.1-7.1,81.5,31.4,124.9C186.7,249.4,210.4,259.7,239.7,260.2z     M164.6,107.3c0-0.3,0.1-0.6,0.1-0.8c3.3-71.7,54.2-79.4,76-79.4h0.4c0.2,0,0.5,0,0.8,0c27,0.6,72.9,11.6,76,79.4    c0,0.3,0,0.6,0.1,0.8c0.1,0.7,7.1,68.7-24.7,104.5c-12.6,14.2-29.4,21.2-51.5,21.4c-0.2,0-0.3,0-0.5,0l0,0c-0.2,0-0.3,0-0.5,0    c-22-0.2-38.9-7.2-51.4-21.4C157.7,176.2,164.5,107.9,164.6,107.3z" data-original="#000000" class="active-path" data-old_color="#000000" />
                                                    <path d="M446.8,383.6c0-0.1,0-0.2,0-0.3c0-0.8-0.1-1.6-0.1-2.5c-0.6-19.8-1.9-66.1-45.3-80.9c-0.3-0.1-0.7-0.2-1-0.3    c-45.1-11.5-82.6-37.5-83-37.8c-6.1-4.3-14.5-2.8-18.8,3.3c-4.3,6.1-2.8,14.5,3.3,18.8c1.7,1.2,41.5,28.9,91.3,41.7    c23.3,8.3,25.9,33.2,26.6,56c0,0.9,0,1.7,0.1,2.5c0.1,9-0.5,22.9-2.1,30.9c-16.2,9.2-79.7,41-176.3,41    c-96.2,0-160.1-31.9-176.4-41.1c-1.6-8-2.3-21.9-2.1-30.9c0-0.8,0.1-1.6,0.1-2.5c0.7-22.8,3.3-47.7,26.6-56    c49.8-12.8,89.6-40.6,91.3-41.7c6.1-4.3,7.6-12.7,3.3-18.8c-4.3-6.1-12.7-7.6-18.8-3.3c-0.4,0.3-37.7,26.3-83,37.8    c-0.4,0.1-0.7,0.2-1,0.3c-43.4,14.9-44.7,61.2-45.3,80.9c0,0.9,0,1.7-0.1,2.5c0,0.1,0,0.2,0,0.3c-0.1,5.2-0.2,31.9,5.1,45.3    c1,2.6,2.8,4.8,5.2,6.3c3,2,74.9,47.8,195.2,47.8s192.2-45.9,195.2-47.8c2.3-1.5,4.2-3.7,5.2-6.3    C447,415.5,446.9,388.8,446.8,383.6z" data-original="#000000" class="active-path" data-old_color="#000000" />
                                                </g>
                                            </g></g> </svg>
                                </i>
                                پروفایل کاربری

                            </a>

                        </div>
                        <div class="user_box_logout">
                            <a style=" cursor: pointer " class="no-border" target="_parent" onclick="signout()">
                                <i class="svg-icon">
                                    <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                         viewBox="0 0 471.2 471.2" style="enable-background:new 0 0 471.2 471.2;" xml:space="preserve">
    <g>
        <g>
            <path d="M227.619,444.2h-122.9c-33.4,0-60.5-27.2-60.5-60.5V87.5c0-33.4,27.2-60.5,60.5-60.5h124.9c7.5,0,13.5-6,13.5-13.5
                s-6-13.5-13.5-13.5h-124.9c-48.3,0-87.5,39.3-87.5,87.5v296.2c0,48.3,39.3,87.5,87.5,87.5h122.9c7.5,0,13.5-6,13.5-13.5
                S235.019,444.2,227.619,444.2z"/>
            <path d="M450.019,226.1l-85.8-85.8c-5.3-5.3-13.8-5.3-19.1,0c-5.3,5.3-5.3,13.8,0,19.1l62.8,62.8h-273.9c-7.5,0-13.5,6-13.5,13.5
                s6,13.5,13.5,13.5h273.9l-62.8,62.8c-5.3,5.3-5.3,13.8,0,19.1c2.6,2.6,6.1,4,9.5,4s6.9-1.3,9.5-4l85.8-85.8
                C455.319,239.9,455.319,231.3,450.019,226.1z"/>
        </g>
    </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
                                        <g>
                                        </g>
    </svg>

                                </i>
                                خروج
                            </a>
                        </div>
                    </div>

                {else}
                    <div class="user_box_login user_box_link"><a
                                href="{$smarty.const.ROOT_ADDRESS}/loginUser" target="_parent">
                            <i class="svg-icon">
                                <svg height="490pt" viewBox="0 -10 490.66667 490" width="490pt"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path d="m325.332031 251h-309.332031c-8.832031 0-16-7.167969-16-16s7.167969-16 16-16h309.332031c8.832031 0 16 7.167969 16 16s-7.167969 16-16 16zm0 0"/>
                                    <path d="m240 336.332031c-4.097656 0-8.191406-1.554687-11.308594-4.691406-6.25-6.25-6.25-16.382813 0-22.636719l74.027344-74.023437-74.027344-74.027344c-6.25-6.25-6.25-16.386719 0-22.636719 6.253906-6.25 16.386719-6.25 22.636719 0l85.332031 85.335938c6.25 6.25 6.25 16.382812 0 22.632812l-85.332031 85.332032c-3.136719 3.160156-7.230469 4.714843-11.328125 4.714843zm0 0"/>
                                    <path d="m256 469.667969c-97.089844 0-182.804688-58.410157-218.410156-148.824219-3.242188-8.191406.808594-17.492188 9.023437-20.734375 8.191407-3.199219 17.515625.789063 20.757813 9.046875 30.742187 78.058594 104.789062 128.511719 188.628906 128.511719 111.742188 0 202.667969-90.925781 202.667969-202.667969s-90.925781-202.667969-202.667969-202.667969c-83.839844 0-157.886719 50.453125-188.628906 128.511719-3.265625 8.257812-12.566406 12.246094-20.757813 9.046875-8.214843-3.242187-12.265625-12.542969-9.023437-20.734375 35.605468-90.414062 121.320312-148.824219 218.410156-148.824219 129.386719 0 234.667969 105.28125 234.667969 234.667969s-105.28125 234.667969-234.667969 234.667969zm0 0"/>
                                </svg>
                            </i>
                            ورود</a>
                    </div>
                    <div class="user_box_register user_box_link"><a target="_parent" href="{$smarty.const.ROOT_ADDRESS}/registerUser">
                            <i class="svg-icon">
                                <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                     viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;"
                                     xml:space="preserve">
						<g>
                            <g>
                                <path d="M367.57,256.909c-9.839-4.677-19.878-8.706-30.093-12.081C370.56,219.996,392,180.455,392,136C392,61.01,330.991,0,256,0
									c-74.991,0-136,61.01-136,136c0,44.504,21.488,84.084,54.633,108.911c-30.368,9.998-58.863,25.555-83.803,46.069
									c-45.732,37.617-77.529,90.086-89.532,147.743c-3.762,18.066,0.745,36.622,12.363,50.908C25.222,503.847,42.365,512,60.693,512
									H307c11.046,0,20-8.954,20-20c0-11.046-8.954-20-20-20H60.693c-8.538,0-13.689-4.766-15.999-7.606
									c-3.989-4.905-5.533-11.29-4.236-17.519c20.755-99.695,108.691-172.521,210.24-174.977c1.759,0.068,3.526,0.102,5.302,0.102
									c1.793,0,3.578-0.035,5.354-0.104c31.12,0.73,61.05,7.832,89.044,21.14c9.977,4.74,21.907,0.499,26.649-9.478
									C381.789,273.582,377.547,261.651,367.57,256.909z M260.878,231.877c-1.623-0.029-3.249-0.044-4.878-0.044
									c-1.614,0-3.228,0.016-4.84,0.046C200.465,229.35,160,187.312,160,136c0-52.935,43.065-96,96-96s96,43.065,96,96
									C352,187.299,311.555,229.329,260.878,231.877z"/>
                            </g>
                        </g>
                                    <g>
                                        <g>
                                            <path d="M492,397h-55v-55c0-11.046-8.954-20-20-20c-11.046,0-20,8.954-20,20v55h-55c-11.046,0-20,8.954-20,20
									c0,11.046,8.954,20,20,20h55v55c0,11.046,8.954,20,20,20c11.046,0,20-8.954,20-20v-55h55c11.046,0,20-8.954,20-20
									C512,405.954,503.046,397,492,397z"/>
                                        </g>
                                    </g>
					 </svg>
                            </i>
                            عضویت</a>
                    </div>
                {/if}

            </div>
            {if $objSession->IsLogin() }
            <div class="logined-links">
                <a target="_parent" class="userProfile-name" href="{$smarty.const.ROOT_ADDRESS}/userProfile">
                    <span>{$objSession->getNameUser()} عزیز خوش آمدید</span>
                    {if $objFunctions->TypeUser($objSession->getUserId()) eq 'Counter'}
                        <span class="CreditHide">(اعتبار آژانس شما {$objFunctions->CalculateCredit($objSession->getUserId())}
                                    ریال)</span>
                    {/if}
                </a>


            </div>
            {/if}
            <div class="info-head-box">
                <div class="tell-head-box"><span class="SMFooterPhone">{$smarty.const.CLIENT_PHONE}</span></div>
                {*<div class="phone-head-box"><span class="SMFooterMobile">{$smarty.const.CLIENT_ADDRESS}</span></div>*}
                <div class="email-head-box"><span class="SMFooterEmail fas fa-envelope">{$smarty.const.CLIENT_EMAIL}</span></div>
            </div>
        </div>
    </div>
</div>


