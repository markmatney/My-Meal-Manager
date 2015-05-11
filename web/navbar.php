<?php

    function generateNavBar($menu, $page) {
        $html = '<div class="navbar-header">';
        $html .= "<a href='#' class='navbar-brand'>{$page}</a>";
        $html .= "</div>";
        $html .= '<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">';
        $html .= '<ul class="nav navbar-nav navbar-right">';
        $html .= '<li class="dropdown">';
        $html .= '<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button">Settings <span class="caret"></span></a>';
        $html .= '<ul class="dropdown-menu" role="menu">';

        foreach ($menu as $key => $item) {
            $html .= "<li>";
            $html .= "<a href='{$item['url']}'>{$item['text']}</a>";
            $html .= "</li>";
        }

        $html .= "</ul>";
        $html .= "</li>";
        $html .= "</ul>";

        echo $html;
    }

?>