<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebForm._Default" %>

                <style>
body{
    font-family: 'Open Sans', 'Helvetica Neue', 'Arial', sans-serif;
    font-size: 13px;       
}

form span{  
    display: block;
    margin: 10px;
}

label{
    display: inline-block;
    width: 175px;     
}

input[type="text"]{
    border: 1px soild #ccc;
    width: 200px;
    padding: 5px;
}

input[type="submit"]{
     padding: 5px 15px;       
}

span#result{
    padding: 5px;
    background: #ff9;        
}

img#loadingimg{
    display: none;                   
}
</style>

<script>
$(document).ready(function(e) {
    
    $("form[ajax=true]").submit(function(e) {
        
        e.preventDefault();
        
        var form_data = $(this).serialize();
        var form_url = $(this).attr("action");
        var form_method = $(this).attr("method").toUpperCase();
        
        $("#loadingimg").show();
        
        $.ajax({
            url: form_url, 
            type: form_method,      
            data: form_data,     
            cache: false,
            success: function(returnhtml){                          
                $("#result").html(returnhtml); 
                $("#loadingimg").hide();                    
            }           
        });    
        
    });
    
});
</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:FormView ID="FormView1" method="post" action="/echo/html/" ajax="true" runat="server">

    <div class="jumbotron">

        <form method="post" action="/echo/html/" ajax="true" runat="server">

            <span id="result"><a href="http://wp.me/p2O9K2-b">Form Sem Refresh</a></span>

            <span>
                <label>Digite sua Mensagem: </label>
                <input type="text" name="html" placeholder="Howdy..." />
            </span>

            <span>
                <label>
                    <img id="loadingimg" src="http://dev.cloudcell.co.uk/bin/loading.gif" />
                </label>
                <input type="submit" value="Enviar" />
            </span>

        </form>

        </asp:FormView>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
