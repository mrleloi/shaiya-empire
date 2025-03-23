<div class="main_container box-shadow drops">

    <div class="header">
        <div class="header_left">Thống kê chiến tích</div>
        <div class="clear"></div>
    </div>


    <div id="ranking"></div>


    <div class="button-container">
        <form id="form_ranking_xephangchung" name="form_ranking_xephangchung" method="post">
            <input type="submit" value="Xếp hạng chung">
        </form>
        <form id="form_ranking_thongkechung" name="form_ranking_thongkechung" method="post">
            <input type="submit" value="Thống kê chung">
        </form>
    </div><br>
    <br>
</div>

<div id="rank_view_top" title="" style="width: 100%;">
    <div id="ranking_top"></div>
</div>

<script type="text/javascript">
    $('#form_ranking_xephangchung').submit(function () {
        loadUpForm('#ranking', './rank/pvp-all.php', '#form_ranking_xephangchung' );
        return false;
    });
    $('#form_ranking_thongkechung').submit(function () {
        loadUpForm('#ranking', './rank/guild-all.php', '#form_ranking_thongkechung' );
        return false;
    });
</script>

<script type="text/javascript">
    $("ul.nav-tabs a").click(function (e) {
        e.preventDefault();
        $(this).tab('show');
    });
</script>


