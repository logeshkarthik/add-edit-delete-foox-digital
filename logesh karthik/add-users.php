<?php include_once('includes/header.php'); 
include_once('config/dbconn.php');
include_once('config/constant.php');

?>
 

 
   
    <div id="createTable" >
        <div class="modal-content">
            <span class="close">&times;</span>
            <form id="frm-user" class="frm-user" name="frm-user">
                 <div>
                     <div class="select-table">
                            <p class="add-menu-hd">User Name</p>
                            <div class="input-field">
                               <label for="txtusername">
                                       <input type="text" name="txtusername" id="txtusername"  />
                               </label>
                            </div>
                     </div>
                     <div class="select-table">
                            <p class="add-menu-hd">Email</p>
                            <div class="input-field">
                               <label for="txtemail">
                                       <input type="email" name="txtemail" id="txtemail" />
                               </label>
                            </div>
                     </div>
                     
                     <div class="select-table">
                            <p class="add-menu-hd">Phone</p>
                            <div class="input-field">
                               <label for="phone">
                                       <input type="number" name="phone" id="phone"  />
                               </label>
                            </div>
                     </div>
                     
                     
                     <div class="select-table">
                            <p class="add-menu-hd">Role</p>
                            <div class="input-field">
                               <label for="role">
                                       
                                       
                                      
                                       <select type="text" name="role" id="role"  >
<?php
$count=1;
$sel_query="Select * from role ORDER BY id desc;";
$result = mysqli_query(db_connect(),$sel_query);
while($row = mysqli_fetch_assoc($result)) { ?>

<option><?php echo $row["role"]; ?></option>



<?php $count++; } ?>
</select>
                               </label>
                            </div>
                     </div>
 
                     <div class="add-type">
                        <?php if($cat_id != ''){?>
                          <p class="add-menu-hd">Gender</p>
                          <label class="container">Male<input type="radio" id="1"  name="rdoavailable" class="rdoavailable">
                          <span class="checkmark"></span>
                          </label>
                          <label class="container">Female<input type="radio" id="0"  name="rdoavailable" class="rdoavailable">
                          <span class="checkmark"></span>
                          </label>
                        <?php }else{ ?>
                          <p class="add-menu-hd">Gender</p>
                          <label class="container">Male<input type="radio" id="1" checked="checked" name="rdoavailable" class="rdoavailable">
                          <span class="checkmark"></span>
                          </label>
                          <label class="container">Female<input type="radio" id="0" name="rdoavailable" class="rdoavailable">
                          <span class="checkmark"></span>
                          </label>
                        <?php } ?>
                        <div class="select-table">
                            <p class="add-menu-hd">Password</p>
                            <div class="input-field">
                               <label for="password">
                                       <input type="password" name="password" id="password"  />
                               </label>
                            </div>
                     </div>
 
                     <!-- <div class="select-table">
                            <p class="add-menu-hd">Confirm Password</p>
                            <div class="input-field">
                               <label for="........">
                                       <input type="number" name="........" id="........"  />
                               </label>
                            </div>
                     </div><br>
                             -->
                     </div>
                     <input type="hidden" name="hidid" id="hidid" class="hidid"  />
                    <input type="button" id="add-user-btn" class="com-buttons add-user-btn" value="Add User" />
                 </div>
                </form>
        </div>
    </div>
    <?php include_once("includes/footer.php"); ?>
    <script>
        
        $(document).ready(function(){
    $("#frm-user").validate({
      rules: {
        "txtusername": {required: true},
        "txtemail": {required: true},
        "phone": {required: true},
        "role": {required: true},
        "password": {required: true},
        
      },
      messages: {
        "txtusername": {
             required: "Please enter the User Name",
         },
         "txtemail": {
             required: "Please enter email id",
         },
         "phone": {
             required: "Please enter phone",
         },
        "role": {
           required: "Please enter role",
         },
         "password": {
             required: "Please enter password",
         },
         
      },
      errorElement: 'div', 
      ignore: ':not(:visible)',
      errorPlacement: function(error, element){
          error.insertAfter(element);  
      }
    });
 
    $("#add-user-btn").click(function(){
      if($("#frm-user").valid()){
        var username = $("#txtusername").val();
        var useremail = $("#txtemail").val();
        var userphone=$("#phone").val();
        var userrole=$("#role").val();
        var userpassword = $("#password").val();
        
       
        add_user(username,useremail,userphone,userrole,userpassword );  
    }
    }); 
 
    function add_user(username,useremail,userphone,userrole,userpassword ){
      $.ajax({
        type:"POST",
        url:"controller/common_controller.php",
        data:{username:username,useremail:useremail,userphone:userphone,userrole:userrole,userpassword :userpassword,Type:"add_user"},
        success:function(result){
          console.log(result);
          window.location.reload();
        }
      });
    }
  });
    </script>