<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ include file="/includes/core.jsp" %>
<div>
  <c:choose>
    <c:when test="${requestScope.FILECOUNT == 0}"></c:when>
    <c:otherwise>
      <span><b>${requestScope.FILECOUNT} files scanned.</b></span><br clear='all' />
    </c:otherwise>
  </c:choose>
  <c:choose>
    <c:when test="${requestScope.ADDCOUNT == 0}"></c:when>
    <c:otherwise>
      <span><b>${requestScope.ADDCOUNT} files added.</b></span><br clear='all' />
    </c:otherwise>
  </c:choose>
  <c:choose>
    <c:when test="${requestScope.UPDATECOUNT == 0}"></c:when>
    <c:otherwise>
      <span><b>${requestScope.UPDATECOUNT} files updated.</b></span><br clear='all' />
    </c:otherwise>
  </c:choose>
  <c:choose>
    <c:when test="${requestScope.QUARANTINECOUNT == 0}"></c:when>
    <c:otherwise>
      <span><font color='red'><b>${requestScope.QUARANTINECOUNT} files do not pass the virus scan. The files are put in quarantine for further examination by a customer service representative. If we find that the files check out good, we will put them on-line. Otherwise, if we find issues with the files we will contact you in order to solve the problem. See virus scan below for details. Please note that password protected archives (ZIP files) cannot be scanned and will be quarantined.</b></font></span><br clear='all' />
    </c:otherwise>
  </c:choose>
  <c:choose>
    <c:when test="${requestScope.ERRORCOUNT == 0}"></c:when>
    <c:otherwise>
      <span><font color='red'><b>${requestScope.ERRORCOUNT} files have errors. These files are rejected. Please fix the errors listed below and reupload.</b></font></span><br clear='all' />
    </c:otherwise>
  </c:choose>
</div>
<span>
  <label style="color: #707070; letter-spacing: .5px;">File&nbsp;Scan&nbsp;Details:</label>
</span>
<textarea style="width: 100%; height: 350px; letter-spacing: .5px; padding: .25rem .5rem; font-size: .8rem;
border: 1px solid #a9a9a9; border-radius: 3px; outline: none;" rows="10" cols="20" name="SCANREPORT" readonly>${requestScope.SCANREPORT}</textarea>
<p style="color: #707070; letter-spacing: .5px;">
  If the uploader is not working in your browser, a basic upload interface that requires minimal browser support is available <a href="javascript:document.legacy.submit ();">here</a>.
</p>
<p style="color: #707070; letter-spacing: .5px;">
  Our former Java Applet uploader is still available <a href="javascript:document.jumploader.submit ();">here</a>. Please be aware that we are phasing out this interface because several browsers including Chrome and Edge no longer support it.
</p>
<form name="jumploader" method="post" action="https://vendors-new.bmtmicro.com/servlets/CustomForms.CustomForm" target="_parent">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-upload-jumploader16.jsp">
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
</form>
<form name="legacy" method="post" action="https://vendors-new.bmtmicro.com/servlets/CustomForms.CustomForm" target="_parent">
  <input type="hidden" name="NEXT_PAGE" value="https://vendors-new.bmtmicro.com/products-manage-files-upload-legacy.jsp">
  <input type="hidden" name="ERROR_PAGE" value="https://vendors-new.bmtmicro.com/error.jsp">
</form>
