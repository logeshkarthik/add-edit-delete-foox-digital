<?php include_once('includes/header.php'); 
include_once('config/dbconn.php');
include_once('config/constant.php');
?>
<div class="main">

    <form id="frm-role" class="frm-role" name="frm-role">
        <div>
            <h2>Add Table page</h2><br />
            <div class="select-table">
                <p class="add-menu-hd">Role</p>
                <div class="input-field">
                    <label for="userrole">
                        <input type="text" name="userrole" id="userrole" placeholder="enter role" />
                    </label>
                </div>
            </div>
            
            
            <br>
           
            
            </div>
            <input type="hidden" name="hidid" id="hidid" class="hidid" />
            <input type="button" id="add-table-btn" class="com-buttons add-category-btn" value="Add Table" />
        </div>
    </form>

</div>
<?php include_once("includes/footer.php"); ?>
<script>
$(document).ready(function() {
    $("#frm-role").validate({
        rules: {
            "userrole": {
                required: true
            },
            
            
            
        },
        messages: {
            "username": {
                required: "Please enter the ROLE",
            },
           
           
            
        },
        errorElement: 'div',
        ignore: ':not(:visible)',
        errorPlacement: function(error, element) {
            error.insertAfter(element);
        }
    });

    $("#add-table-btn").click(function() {
        if ($("#frm-role").valid()) {
            var userrole = $("#userrole").val();
            
            add_role(userrole);
        }
    });

    function add_role(userrole) {
        $.ajax({
            type: "POST",
            url: "controller/common_controller.php",
            data: {
                userrole: userrole,
                
        

                
                Type: "add_role"
            },
            success: function(result) {
               console.log(result);
               window.location.reload();
            }
        });
    }
});
</script>