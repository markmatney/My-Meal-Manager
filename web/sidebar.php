<?php
    $user = "User";
    $sidebar= array(
        'lists' => array('text'=>'My Lists', 'url'=>'lists.php'),
        'recipes' => array('text'=>'Recipes', 'url'=>'recipes.php'),
        'explore' => array('text'=>'Explore', 'url'=>'explore.php'),
        'logout' => array('text'=>'Log Out', 'url'=>'#'),
    );

    function generateSideBar($menu, $user) {
        $html = '<ul class="sidebar-nav">';
        $html .= '<li class="sidebar-brand">';
        $html .= "<span>{$user}</span>";
        $html .= "</li>";

        foreach ($menu as $key => $item) {
            $html .= "<li>";
            $html .= "<a href='{$item['url']}'>{$item['text']}</a>";
            $html .= "</li>";
        }

        $html .= "</ul>";

        echo $html;
    }

    generateSideBar($sidebar, $user);
?>