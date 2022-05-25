<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="DinDinAgora.Index" %>

<!DOCTYPE html>
<html lang="pt">

<head>
  <style>



      #DIVZAO {
          width:1507px;
          height:500px;
          
          background-color:#1B3B6B;
          border-radius: 10px;
          float:top;
           }

        #DIVIZINHA {
          width:200px;
          height:45px;
          background-color:#1B3B6B;
          border: 2px solid;
          border-color:rgb(255, 255, 255);
        }
        #DIVIZINHA1 {
          width:200px;
          height:30px;
          background-color:#2B5EAB;
          border: 2px solid;
          border-color:rgb(255, 255, 255);

        }
        #numero {
          width:130px;
          height:41px;
          background-color:#2B5EAB;
          border: 0.5px solid;
          border-color:rgb(255, 255, 255);
        }
        #uf {
          width:70px;
          height:41px;
          background-color:#2B5EAB;
          border: 0.5px solid;
          border-color:rgb(255, 255, 255);
          float: left;

        }
   

        #numero1 {
          width:130px;
          height:28px;
          background-color:#2B5EAB;
          border: 0.5px solid;
          border-color:rgb(256, 256, 256);
        }
        #uf1 {
          width:70px;
          height:28px;
          background-color:#2B5EAB;
          border: 0.5px solid;
          border-color:rgb(256, 256, 256);
          float: left;

        }
        #teste {
          width:800px;
          height:76px;
          background-color:rgb(52, 45, 154);
          border: 0.5px solid;
          border-color:rgb(256, 256, 256);

        }
        #REMEDIO {
          width:380px;
          height:80px;
          background-color:#2B5EAB;
          border: 0.5px solid;
          border-color:rgb(0, 0, 0);

        }
        #PRESCRICAO {
          width: 727px;
          height:305px;
          background-color:#2B5EAB;
          border: 0.5px solid rgb(0, 0, 0);
      }
        #PRESCRICAO1 {
          width: 92px;
          height:180px;
          margin-bottom: 1000px;
          background-color:#2B5EAB;
          border: 0.5px solid;
          border-color:rgb(0, 0, 0);

        }
        
      
        #form {
          width:97%;
          height:31px;
          float: left;


        }
        #responsaveis {
          width:95%;
          height:226px;
          background-color:#2B5EAB;
          border: 1px solid rgb(256, 256, 256);
          float: left;

        }
      
        #form2 {
          width:980px;
          height:350px;
          background-color:rgb(94, 194, 74);
          border: 0.5px solid;
          border-color:rgb(218, 203, 203);

        }
      #coluna1{
        float:left;
        height: 100%;
        width: 49%;

      }
      #coluna2{
        float:left;
        width: 49%;
        height: 100%;
      }
      #coluna3{ 
        width: 50%;
        height: 100%;
        float: left;

      }
      
      #formulario1{
        float: left;
        height: 50% ;
        width: 100%;
      }
      #button{
        height: 50px;
        width: 100%;
        float:left;
        margin-top: 10px;
      }
      #test{
        width:70px;
          height:28px;
          background-color:#C7EAFB;
          border: 0.5px solid;
          border-color:rgb(0, 0, 0);
          float: left;
      }
      #remedio_selecionado{
        width:100%;
        height:50%;
        border: 0.10px solid red;
        border-color:rgb(0, 0, 0);
        float: left;
    
    }
  

  
   
    </style>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HIS Analytcs | Analise de Recomendação</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

  <!--NECESSÁRIO EM TODAS AS TELAS, POIS É A LIB AJAX-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>

<body id="page-top" background="./img/fundoDegrade.jpg">

    <form id="form1" runat="server">

  <nav class="navbar navbar-light" style="background-color: #2B5EAB;">
    <img src="./img/LogoHIS.png" alt="Smiley face" height="70" width="240">

    

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>
  </nav>


    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="">Inicial</a>
              </li>
              <li class="breadcrumb-item">
                  <a href="indexHOME.html">Análise de Recomendação</a>
                </li>
               
               
        </ol>

        <center><h5  style="color:rgb(52, 45, 154);" >  ANÁLISE DE RECOMENDAÇÃO </h5> </center>

            
                    <div id = "DIVZAO">  
                            <div id="coluna1">
                              <div id="Titulo_crm">
                  
                                   
                  
                                  <!-- <b style="margin-left: 750px">DATA DE EMISSÃO </b><input type="date" style=" background-color:transparent; border: 1px solid; border-color:rgb(7, 4, 4) ; width:170px;border-radius: 5px;">
                      
                                   <div id="DIVIZINHA1" style="margin-left: 40px;margin-top: 30px;">
                      
                                      <div id="uf1" style="color:white; margin-left: 0px">
                                        <center><b>Ag.</b></center>
                    
                                  </div>
                      
                                      <div id="numero1" style="color:white; margin-left: 67px">
                                        <center><b>Conta</b></center>
                                </div>
                                               
                      
                                    </div>
                             
                                    <div id="DIVIZINHA" style="margin-left: 40px">
                      
                                     <div id="uf" style="margin-left: 0px">
                                        <center><a id="ufDigitado"   style="color:white; font-size: 10px;">{Agencia }</a></center>             
                                        
                                  </div>
                      
                                      <div id="numero" style="margin-left: 67px; ">
                                          <center><a id="idDigitado"   style="color:white; font-size: 13px;">{Conta }</a></center>             
                      
                                  </div>
                                   -->
                                    </div>
                                    <div id="form" style="color:white; margin-left: 3%;margin-right: 0px;margin-top: 58px;" >
                                      <b  style="margin-left: 15px; margin-top: 25px;">Olá, bem vindo! </b>
                                     <br>
                                    <br>
                                    
                                        
                                      <b for="cliente" style=" color:white; margin-top: 4%;margin-left:3%;"> Cliente:</b>
                                        <asp:DropDownList ID="Clientes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Clientes_SelectedIndexChanged1">
                                        </asp:DropDownList>
                                        <b style="margin-left: 30px;">
                                        <br />
                                        <br />
                                        PRODUTOS CONTRATADOS </b>
                                        <div id="responsaveis" style="margin-left: 1px; margin-top: 2.7%;">
                                            <asp:GridView ID="ProdutosContratados" runat="server" Height="214px" Width="675px" 
                                                AlternatingRowStyle-BackColor="#b5cbec" RowStyle-BackColor="White" HeaderStyle-ForeColor="White"
                                                RowStyle-ForeColor="Black">
                                                <AlternatingRowStyle BackColor="#B5CBEC" />
                                                <HeaderStyle ForeColor="White" />
                                                <RowStyle BackColor="White" ForeColor="Black" />
                                            </asp:GridView>
                                            <br>
                                       <!--
                                        <center>
                                          <button type="button" id="cadastroReceita" class="btn btn-secondary btn-sm" style="width:130px; height:35px; margin-top: 10%;background-color:#2B5EAB;border-radius: 15px; color:white;"  > Atualizar </button>
                                        </center>
                                      -->
                                        </div>
                                      
                                <!--FIM AQUI FORM1-->
                                        </div>
                            </div>
                  
                           
                  
                            <div id="coluna2">
                              <asp:Label ID="DataAtual" runat="server" Text="" style="text-align:center; color:#C7EAFB; margin-right: 16%;margin-top: 30px; border: 1px solid white; width:211px; border-radius: 5px;float: right; height: 28px;"></asp:Label>
                                </a><b style=" color:white; float: right;margin-right: 2%;margin-top: 30px;">Data </b>
                             <div id="titulo"style="color:white; margin-top:16.5%; margin-left:4%"> 
                                <b>RECOMENDAÇÕES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b>
                              
                             &nbsp;</div>
                             <div id="PRESCRICAO" style="margin-top: 15px; margin-left: 21px; border-color:white;  "> 
                              
                                
                                 <asp:GridView ID="ProdutosRecomendadosSimilaridade" runat="server" Height="302px" Width="722px" 
                                     AlternatingRowStyle-BackColor="#b5cbec" RowStyle-BackColor="White" HeaderStyle-ForeColor="White">
<AlternatingRowStyle BackColor="#B5CBEC"></AlternatingRowStyle>

                                     <HeaderStyle ForeColor="White" />
                                     <RowStyle BackColor="White" />
                                 </asp:GridView>
               
                                
                             </div>
                             <!--
                             <div id="PRESCRICAO1" style="margin-top: 20px; margin-left: 235px; border-color:white;  "> 
                              
                              <a class="form-control " id="remedios_prescrito" style="color:white; margin-top:5%;width:80px; font-size: 15px; margin-left:5px; background-color:#1B3B6B;"  placeholder="Remedios prescritos" >x</a> 
                              <a class="form-control " id="remedios_prescrito" style="color:white; margin-top:1%;width:80px; font-size: 15px; margin-left:5px; background-color:#1B3B6B;"  placeholder="Remedios prescritos" >x</a>
                              <a class="form-control " id="remedios_prescrito" style="color:white; margin-top:1%;width:80px; font-size: 15px; margin-left:5px; background-color:#1B3B6B;"  placeholder="Remedios prescritos" >x</a>
                              <a class="form-control " id="remedios_prescrito" style="color:white; margin-top:1%;width:80px; font-size: 15px; margin-left:5px; background-color:#1B3B6B;"  placeholder="Remedios prescritos" >x</a>
              
                             -->
                          </div>
                      
                                
                           
                           
                          </div>
                            
                            
                            <center>
                              <button type="button" id="atualizarInformacoes" class="btn btn-secondary btn-sm" style="width:130px; height:35px; margin-top: 2%; margin-bottom: 2%; background-color:#2B5EAB;border-radius: 15px; color:white;"  > Atualizarbutton>
                            </center>
                            <!-- FIM DIVIZAO-->
                         
                              </div>
                     
                             
                      </div>
                  
                    </div>
                  
                  
                    <a class="scroll-to-top rounded" href="#page-top">
                      <i class="fas fa-angle-up"></i>
                    </a>
                    <script src="vendor/jquery/jquery.min.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
                    <script src="js/sb-admin.min.js"></script>
                  
       
         

       	
    


     

    </div>

  


  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/sb-admin.min.js"></script>

    </form>

</body>

</html>

<script> 
function apareceDesaparece(el) {
        var display = document.getElementById(el).style.display;
        if(display == "none")
            document.getElementById(el).style.display = 'block';
        else
            document.getElementById(el).style.display = 'none';
    }
</script>	