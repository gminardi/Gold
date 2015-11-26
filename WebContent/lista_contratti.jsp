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
        Per modificare i dati di un contratto esistente inserisci il NUMERO CONTRATTO qui sotto oppure clicca sul NUMERO CONTRATTO (#) nella tabella in basso.<br>  
            Per inserire un <strong style="color: red">NUOVO CONTRATTO</strong> seleziona prima un dipendente dalla sezione Anagrafica Dipendenti.
        <s:textfield label="N° Contratto" name="n_contratto"/>
        <s:submit class="myOKButton" align="right" value="   MODIFICA   "></s:submit>
    </s:form>
        <table style="width: 80%; background-color: white">
            <tr>
                <td style="font-size: small"><h1>Contratti</h1>I contratti cessati sono evidenziati in blu chiaro.</td><hr/>

            <td><form action="getTabellaContratti"><input class="myOKButton" type="submit" value="Tutti per COGNOME"></form></td>
            <td><form action="getTabellaContrattiProfilo"><input class="myOKButton" type="submit" value="Tutti per PROFILO"></form></td>
            <td><form action="getTabellaContrattiCessati"><input class="myOKButton" type="submit" value="Contratti CESSATI"></form></td>
            <td><form action="getTabellaContrattiNonCessati"><input class="myOKButton" type="submit" value="Contratti ATTIVI"></form></td>
        </tr>
    </table>
    <body>

        <div style="height:700px; overflow:auto"> 

            <table style="width: 80%; border-bottom-color: gray; border-width: 2px;" border = 0>
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

    

