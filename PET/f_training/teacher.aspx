<%@ Page Title="" Language="C#" MasterPageFile="~/f_masterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="CssHolder" Runat="Server">
    <style>
    .ui-accordion{
		width: 600px;
		margin: auto;
	}
	#teacherAccordion img{
		width: 150px;
		float: left;
		margin-right: 10px;
        margin-left:5px;
        margin-top:5px;
        box-shadow:10px 10px 5px gray;
	}
	.ui-accordion-content p{
		color: gray;
	}
        .accordionTitle {
            border:1px black solid;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            /*background-image: linear-gradient(to top, #ffffff, #ed6436);*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyHolder" Runat="Server">
      <!-- Team Start  https://www.doggy-lab.com/team -->
    <div class="container mt-4 pt-1 pb-3" id="app">
        <div class="d-flex flex-column text-center">           
            <h1 class="display-4 m-0">訓練師<span class="text-primary">資訊</span></h1>
        </div>
        <div class="row">
            <div id="teacherAccordion">
                <template v-for="item in trainerAry">
                    <div data-toggle="collapse" :data-target="'#content'+item.EmployeeID" class="pt-2 pb-2 bg-primary text-center text-dark accordionTitle"><h3>{{item.EmployeeShortName}}</h3></div>
                    <div :id="'content'+item.EmployeeID" class="collapse show bg-light " data-parent="#teacherAccordion">
                        <img :src="'/i_trainer/'+ item.EmployeeImgUrl" />
                         <h5 class="text-primary">{{item.Subject}}</h5>  
                         <p style="white-space: pre-wrap; word-wrap: break-word" class="text-dark">{{item.WantToSay}}</p>                                                                                      
                        <h5 class="text-primary">訓綀師專長</h5>
                         <p style="white-space: pre-wrap; word-wrap: break-word" class="text-dark">{{item.Skill}}</p>                            
                         <h5 class="text-primary">相關經歷</h5>
                         <label style="white-space: pre-wrap; word-wrap: break-word" class="text-dark">{{item.Experience}}</label>
                    </div>
                </template>
               <%--  <button v-for="item in trainerAry" data-toggle="collapse" :data-target="'#content'+item.EmployeeID" class="pt-2 pb-2 bg-primary text-center text-dark accordionTitle">
                     <h3>{{item.EmployeeShortName}}</h3>
                 </button>
                <div v-for="item in trainerAry" :id="'content'+item.EmployeeID" class="collapse bg-light " data-parent="#teacherAccordion">
                        <img :src="'/i_trainer/'+ item.EmployeeImgUrl" />
                         <h5 class="text-primary">{{item.Subject}}</h5>  
                         <p style="white-space: pre-wrap; word-wrap: break-word" class="text-dark">{{item.WantToSay}}</p>                                                                                      
                        <h5 class="text-primary">訓綀師專長</h5>
                         <p style="white-space: pre-wrap; word-wrap: break-word" class="text-dark">{{item.Skill}}</p>                            
                         <h5 class="text-primary">相關經歷</h5>
                         <label style="white-space: pre-wrap; word-wrap: break-word" class="text-dark">{{item.Experience}}</label>
                    </div>--%>
            </div>

        </div>
    </div>
    <!-- Team End -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSHolder" Runat="Server">
     <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
     <script>
         $(function () {
             $("#navbarCollapse div").children("a").removeClass("active");
             $("a[href='/f_training/teacher.aspx']").addClass("active");
             $("a[href='/f_training/teacher.aspx']").parent().prev().addClass("active");

             var app = new Vue({
                 el: '#app',
                 data: {
                     myData: {
                         commentString: "",
                     },
                     trainerAry: []
                 },
                 methods: {
                     GetTrainers: function () {
                         $.ajax({
                             type: "POST",
                             url: "/WebService.asmx/GetTrainersDetail",
                             contentType: "application/json; charset=utf-8",
                             dataType: "json",
                             success: function (result) {
                                 app.trainerAry = result.d;
                             }
                         });

                         $("#teacherAccordion").accordion({
                             header: "h3",
                             active: 1, //true
                             collapsible: true
                         });
                     },
                 },
                 created: function () {
                     this.GetTrainers();
                 }
             });


         })
     </script>
</asp:Content>

