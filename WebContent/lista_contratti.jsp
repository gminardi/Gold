<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="/struts-tags" prefix="s" %> 

<link rel="stylesheet" type="text/css" href="stylelogin.css">

<jsp:include page="menu_amministratore.jsp"></jsp:include>  
    <!--    <hr/>  -->

    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>
    <s:form action="viewContratto">
        <h1>CONTRATTI</h1>
        Per modificare i dati di un contratto esistente inserisci il NUMERO CONTRATTO qui sotto oppure clicca sul NUMERO CONTRATTO (#) nella tabella in basso.<br>  
        Per inserire un <strong style="color: red">NUOVO CONTRATTO</strong> seleziona prima un dipendente dalla sezione Anagrafica Dipendenti.
        <s:textfield label="N° Contratto" name="n_contratto"/>
        <s:submit class="myOKButton" align="right" value="   MODIFICA   "></s:submit>
    </s:form>
        <hr/>

    <s:form action="">
        <table style="width: 50%; background-color: #ffffff" border = 0>
        <tbody>
            <tr>
                <td><table style="background-color: #ffffff"><tbody><tr><td><s:submit class="myOKButton" value="Tutti per COGNOME" action="getTabellaContratti"/></td></tr></tbody></table></td>
                <td><table style="background-color: #ffffff"><tbody><tr><td><s:submit class="myOKButton" value="Tutti per PROFILO" action="getTabellaContrattiProfilo"/></td></tr></tbody></table></td>
                <td><table style="background-color: #ffffff"><tbody><tr><td><s:submit class="myOKButton" value="Contratti CESSATI" action="getTabellaContrattiCessati"/></td></tr></tbody></table></td>
                <td><table style="background-color: #ffffff"><tbody><tr><td><s:submit class="myOKButton" value="Contratti ATTIVI" action="getTabellaContrattiNonCessati"/></td></tr></tbody></table></td>
              </tr>
            </tbody>
        </table>
    </body>
    </s:form>

<body>

    <div style="height:700px; overflow:auto"> 

        <table style="width: 100%; border-bottom-color: gray; border-width: 2px;" border = 0>
            <thead class="title">
                <tr>
                    <th>#</th>
                    <th>Cognome</th>
                    <th>Nome</th>
                    <th>Cognome Dipendente</th>
                    <th>Nome Dipendente</th>
                    <th>Data Assunzione</th>
                    <th>Data Cessazione</th>
                    <th>Profilo</th>
                </tr>
            </thead>

        <s:iterator value="%{#request.contratti}" var="ctr" status="status">
            <tr class="<s:if test="#status.even">colore1</s:if><s:else>colore2</s:else>
                <s:if test="#ctr.data_cessaz != null">colore3</s:if>"
                    >

                    <td>

                    <s:url action="viewContratto" var="url" escapeAmp="false">                                                      
                        <s:param name="n_contratto" value="n_contratto"/>
                    </s:url>
                    <a href="<s:property value="#url"/>"><s:property value="n_contratto"/></a></td>
                <td><s:property value="cognome"/></td>
                <td><s:property value="nome"/></td>
                <td><s:property value="cognome_dip"/></td>
                <td><s:property value="nomedip"/></td>
                <td><s:property value="data_assunzione"/></td>
                <td><s:property value="data_cessaz"/></td>
                <td><s:property value="prospetto_duff"/></td>
            </tr>
        </s:iterator>
    </table>
</div>
