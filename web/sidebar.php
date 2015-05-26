<?php
    session_start();
    $uid = $_SESSION["uid"];
    $user = "User";
    $sidebar= array(
        'lists' => array('text'=>'My Lists', 'url'=>'lists.php'),
        'recipes' => array('text'=>'My Recipes', 'url'=>'my_recipes.php'),
        'explore' => array('text'=>'Explore', 'url'=>'explore.php'),
        'logout' => array('text'=>'Log Out', 'url'=>'logout.php'),
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