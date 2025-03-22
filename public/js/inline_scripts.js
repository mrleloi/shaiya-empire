
    var $TIMEZONE = 'Asia/Ho_Chi_Minh';

    $(document).ready(function() {
      $('a[title]').tooltip();
    });
  


        if (location.protocol !== 'https:') {
		location.replace(`https:${location.href.substring(location.protocol.length)}`);
		}
 


  $(document).ready(function() {
    var delay = 5000;
    $('.fading-notification').each(function() {
      $(this).delay(delay).fadeOut(500);
      delay = delay + 500;
    });
  });



			$('#shopid_33').submit(function () {
			if (confirm('Bạn có chắc chắn muốn mua vật phẩm Hộp chế tạo (1)?')) {
			  loadUpForm('#shopid_33_result', './pages/shop.php', '#shopid_33' );
			  loadUpForm('#coins', './pages/shop.php?ep=coin', '#shopid_33' );
			}
			return false;
		  });
			


			$('#shopid_34').submit(function () {
			if (confirm('Bạn có chắc chắn muốn mua vật phẩm Chim cú mèo?')) {
			  loadUpForm('#shopid_34_result', './pages/shop.php', '#shopid_34' );
			  loadUpForm('#coins', './pages/shop.php?ep=coin', '#shopid_34' );
			}
			return false;
		  });
			


			$('#shopid_35').submit(function () {
			if (confirm('Bạn có chắc chắn muốn mua vật phẩm Sói ?')) {
			  loadUpForm('#shopid_35_result', './pages/shop.php', '#shopid_35' );
			  loadUpForm('#coins', './pages/shop.php?ep=coin', '#shopid_35' );
			}
			return false;
		  });
			


			$('#shopid_44').submit(function () {
			if (confirm('Bạn có chắc chắn muốn mua vật phẩm Thời trang Ngôi Sao?')) {
			  loadUpForm('#shopid_44_result', './pages/shop.php', '#shopid_44' );
			  loadUpForm('#coins', './pages/shop.php?ep=coin', '#shopid_44' );
			}
			return false;
		  });
			


			$('#shopid_47').submit(function () {
			if (confirm('Bạn có chắc chắn muốn mua vật phẩm Thời trang Kiêu Hãnh?')) {
			  loadUpForm('#shopid_47_result', './pages/shop.php', '#shopid_47' );
			  loadUpForm('#coins', './pages/shop.php?ep=coin', '#shopid_47' );
			}
			return false;
		  });
			


			$('#shopid_48').submit(function () {
			if (confirm('Bạn có chắc chắn muốn mua vật phẩm Thời trang Thần Thánh?')) {
			  loadUpForm('#shopid_48_result', './pages/shop.php', '#shopid_48' );
			  loadUpForm('#coins', './pages/shop.php?ep=coin', '#shopid_48' );
			}
			return false;
		  });
			


			$('#shopid_49').submit(function () {
			if (confirm('Bạn có chắc chắn muốn mua vật phẩm Cuộn Trang bị cấp 69?')) {
			  loadUpForm('#shopid_49_result', './pages/shop.php', '#shopid_49' );
			  loadUpForm('#coins', './pages/shop.php?ep=coin', '#shopid_49' );
			}
			return false;
		  });
			


			function subtractQty(n){
				if(document.getElementById("product_qty"+ n).value - 1 < 1)
					return;
				else
					 document.getElementById("product_qty"+ n).value--;
			}
			function addQty(n){
				if (document.getElementById("product_qty"+ n).value + 1 > 200)
					return;
				document.getElementById("product_qty"+ n).value++;
			}
		


    $(document).ready(function() {
      $('#shops > #shop-page:not(:first)').hide();
      $('.pagination').jqPagination({
        page_string : '{current_page}/{max_page}',
        max_page : $('#shops #shop-page').length,
        paged : function(page) {
          $("#view").scrollintoview();
          $('#shops #shop-page').fadeOut(100);
          $($('#shops #shop-page')[page - 1]).fadeIn(500);
        }
      });
    });
    $(document).ready(function() {
      $('img[title]').tooltip();
    });
  


                      function servertime() {
						var time = moment().tz('Asia/Ho_Chi_Minh').format('D, MMMM YYYY :: H:mm:ss');
                         $('#server-time-clock').html(time);
                      }
                      setInterval(servertime, 1000);
                    


      $(document).ready(function() {
        $("a").click(function(event) {
          $('.dropdown.open .dropdown-toggle').dropdown('toggle');
        });
      });
	  $('.nhiemvu').click(function(e) {
        loadUp('#data', './pages/nhiemvu.php');
        return false;
      });
      $('.logout').click(function(e) {
        loadUp('#data', './pages/logout.php');
        return false;
      });
      $('.password1').click(function(e) {
        loadUp('#data', './pages/password1.php');
        $('#view').scrollintoview();
        return false;
      });
	  $('.password2').click(function(e) {
        loadUp('#data', './pages/password2.php');
        $('#view').scrollintoview();
        return false;
      });
      $('.resurrect').click(function(e) {
        loadUp('#data', './pages/hoisinh.php');
        $('#view').scrollintoview();
        return false;
      });
	  $('.kickoff').click(function(e) {
        loadUp('#data', './pages/kickoff.php');
        $('#view').scrollintoview();
        return false;
      });
      $('.userinfo').click(function(e) {
        loadUp('#data', './pages/userinfo.php');
        $('#view').scrollintoview();
        return false;
      });
	  $('.changemail').click(function(e) {
        loadUp('#data', './pages/changemail.php');
        $('#view').scrollintoview();
        return false;
      });
	  $('.doiloai').click(function(e) {
        loadUp('#data', './pages/doiloaitrangbi.php');
        $('#view').scrollintoview();
        return false;
      });
	  $('.nangcapaochoang').click(function(e) {
        loadUp('#data', './pages/nangcapaochoang.php');
        $('#view').scrollintoview();
        return false;
      });
	  
	  $('.nangcaptrangbi').click(function(e) {
        loadUp('#data', './pages/nangcaptrangbi.php');
        $('#view').scrollintoview();
        return false;
      });
	  
      $('.account').click(function(e) {
        return false;
      });
    


	
    $('.register').click(function(e) {
      loadUp('#data', './pages/register.php');
      $('#view').scrollintoview();
      return false;
    });
    $('.download').click(function(e) {
      loadUp('#data', './pages/download.php');
      $('#view').scrollintoview();
      return false;
    });
    $('.donate').click(function(e) {
      loadUp('#data', './pages/donate.php');
      $('#view').scrollintoview();
      return false;
    });
    $('.ranking').click(function(e) {
      loadUp('#data', './rank/ranking.php');
      $('#view').scrollintoview();
      return false;
    });

    $('.items').click(function(e) {
      loadUp('#data', './pages/items.php');
      $('#view').scrollintoview();
      return false;
    });
    $('.shop').click(function(e) {
      loadUp('#data', './pages/shop.php');
      loadUp('#shop-menu', './pages/shop_menu.php');
      $('#view').scrollintoview();
      return false;
    });
    $('.giftcode').click(function(e) {
      loadUp('#data', './pages/giftcode.php');
      $('#view').scrollintoview();
      return false;
    });
    $('.view-ranking').click(function(e) {
      loadUp('#data', './pages/ranking.php');
      $('#view').scrollintoview();
      return false;
    });
    
    $('.bosstime').click(function(e) {
      loadUp('#data', './pages/bosstime.php');
      $('#view').scrollintoview();
      return false;
    });

    $('.quydinh').click(function(e) {
      loadUp('#data', './pages/quydinh.php');
      $('#view').scrollintoview();
      return false;
    });
    $('.serverinfo').click(function(e) {
      loadUp('#data', './pages/info.php');
      $('#view').scrollintoview();
      return false;
    });
	
	$('.huongdan').click(function(e) {
      loadUp('#data', './pages/huongdan.php');
      $('#view').scrollintoview();
      return false;
    });
	  
  