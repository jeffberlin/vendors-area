<tr onclick="highlightLinks(this);">
  <td text>
    <a href="javascript:editUser (request.getParameter ("USERID"));"><%= request.getParameter ("LOGINNAME") %></a>
  </td>
  <td text>
    <%= request.getParameter ("EMAIL") %>
  </td>
  <td text>
    <%= request.getParameter ("NAME") %>
  </td>
  <td option>
    <button type="button" name="Remove" class="remove" onclick="deleteUser (request.getParameter ("USERID"));">X</button>
  </td>
</tr>
