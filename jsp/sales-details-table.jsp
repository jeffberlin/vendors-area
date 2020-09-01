<%!
  public static final class ColumnInfo {
    int     Type[];
    String  Header[];
    String  Filter[];
    String  Data[];
    String  Total[];
  }

  public String getTableData (javax.servlet.http.HttpServletRequest req) {
    String p = req.getParameter ("COLUMNDATA");
    if (p != null) {
      try {
        ColumnInfo colInfo = new com.google.gson.Gson ().fromJson (p, ColumnInfo.class);
        String colTypeNames[] = {
          "text",   // 0 - Text
          "number", // 1 - Number
          "money",  // 2 - Amount
          "money",  // 3 - Currency
          "date",   // 4 - Date
          "info",   // 5 - EMail
          "number"  // 6 - Order ID
        };
        StringBuffer s = new StringBuffer ();
        s.append ("<thead><tr class=\"table-category\">");
        for (int i = 0; i < colInfo.Header.length; i++) {
          s.append ("<th class=\"sortable sort-column text-center sort\">" + "<a href=\"#\" class=\"fdTableSortTrigger\" " + colTypeNames[colInfo.Type[i]] + ">" + colInfo.Header[i] + "</a>" + "</th>");
        }
        s.append ("</tr></thead><tbody class=\"text-center\"><tr>");
        for (int i = 0; i < colInfo.Filter.length; i++) {
          s.append ("<th " + colTypeNames[colInfo.Type[i]] + "><input class=\"input-search\" type=\"text\" name=\"FILTER\" placeholder=\"Search\" value=\"" + colInfo.Filter[i] + "\" style=\"width: 100%\" onkeypress=\"filterKeyPress(event)\"/></th>");
        }
        s.append ("</tr>");
        for (int j = 0; j < colInfo.Data.length; ) {
          s.append ("<tr>");
          for (int i = 0; i < colInfo.Type.length; i++, j++) {
            String d = colInfo.Data[j];
            switch (colInfo.Type[i]) {
              case 3: // Currency
              d = "<b>" + d + "</b>";
              break;
              case 5: // EMail
              d = "<a href=mailto:" + d + ">" + d + "</a>";
              break;
              case 6: //Order ID with invoice link
              d = "<a href=\"javascript:invoice(" + d + ");\">" + d + "</a>";
              break;
            }
            s.append ("<td " + colTypeNames[colInfo.Type[i]] + ">" + d + "</td>");
          }
          s.append ("</tr>");
        }
        s.append ("</tbody><tfoot><tr class=\"table-total text-center\">");
        for (int i = 0; i < colInfo.Total.length; i++) {
          s.append ("<td " + colTypeNames[colInfo.Type[i]] + "><strong>" + colInfo.Total[i] + "</strong></td>");
        }
        s.append ("</tr></tfoot>");
        return (s.toString ());
      }
      catch (Exception e) {
        return ("Exception: " + e.toString ());
      }
    }
    return ("Parameter COLUMNDATA is undefined");
  }
%>
<div class="table-responsive d-block">
  <table class="table">
    <%= getTableData(request) %>
  </table>
</div>
