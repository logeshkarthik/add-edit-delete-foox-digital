<?php include_once('includes/header.php'); 
include_once('config/dbconn.php');
include_once('config/constant.php');
?>
<div class="main">

    <form id="frm-table" class="frm-table" name="frm-table">
        <div>
            <h2>Add Table page</h2><br />
            <div class="select-table">
                <p class="add-menu-hd">Table Name</p>
                <div class="input-field">
                    <label for="txttablname">
                        <input type="text" name="txttablename" id="txttablename" />
                    </label>
                </div>
            </div>
            <div class="select-table">
                <p class="add-menu-hd">Short Name</p>
                <div class="input-field">
                    <label for="txtshortname">
                        <input type="text" name="txtshortname" id="txtshortname" />
                    </label>
                </div>
            </div>
            <div class="select-table">
                <p class="add-menu-hd">Table Capacity</p>
                <div class="input-field">
                    <label for="txttablecap">
                        <input type="number" name="txttablecap" id="txttablecap" />
                    </label>
                </div>
            </div>

            <div class="add-type">
                <?php if($cat_id != ''){?>
                <p class="add-menu-hd">Available</p>
                <label class="container">Yes<input type="radio" id="1" name="rdoavailable" class="rdoavailable">
                    <span class="checkmark"></span>
                </label>
                <label class="container">No<input type="radio" id="0" name="rdoavailable" class="rdoavailable">
                    <span class="checkmark"></span>
                </label>
                <?php }else{ ?>
                <p class="add-menu-hd">Available</p>
                <label class="container">Yes<input type="radio" id="1" checked="checked" name="rdoavailable"
                        class="rdoavailable">
                    <span class="checkmark"></span>
                </label>
                <label class="container">No<input type="radio" id="0" name="rdoavailable" class="rdoavailable">
                    <span class="checkmark"></span>
                </label>
                <?php } ?>

            </div>
            <input type="hidden" name="hidid" id="hidid" class="hidid" />
            <input type="button" id="add-table-btn" class="com-buttons add-category-btn" value="Add Table" />
        </div>
    </form>

</div>
<?php include_once("includes/footer.php"); ?>
<script>
$(document).ready(function() {
    $("#frm-table").validate({
        rules: {
            "txttablename": {
                required: true
            },
            "txtshortname": {
                required: true
            },
            "txttablecap": {
                required: true
            },
        },
        messages: {
            "txttablename": {
                required: "Please enter the table Name",
            },
            "txtshortname": {
                required: "Please enter the Table Short Name",
            },
            "txttablecap": {
                required: "Please enter the Table Capacity",
            }
        },
        errorElement: 'div',
        ignore: ':not(:visible)',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    });

    $("#add-table-btn").click(function() {
        if ($("#frm-table").valid()) {
            var tablename = $("#txttablename").val();
            var shortname = $("#txtshortname").val();
            var tablecapacity = $("#txttablecap").val();
            var table_id = $("#hidid").val();
            var is_available = $("input[name='rdoavailable']:checked").attr('id');
            add_table(tablename, shortname, tablecapacity, is_available, table_id);
        }
    });

    function add_table(tablename, shortname, tablecapacity, is_available, table_id) {
        $.ajax({
            type: "POST",
            url: "controller/common_controller.php",
            data: {
                tablename: tablename,
                shortname: shortname,
                tablecapacity: tablecapacity,
                is_available: is_available,
                table_id: table_id,
                Type: "add_table"
            },
            success: function(result) {
                console.log(result);
              //  window.location.reload();
            }
        });
    }
});
</script>