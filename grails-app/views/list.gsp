
<table>
    <tr><th>Serial No</th><th>Machine Name</th><th>Model No</th><th>Brand</th></tr>
    <g:each in="${machineList}" var="cust">
        <tr><td>${cust.sl_no}</td><td>${cust.machine_name}</td><td>${cust.model_no}</td><td>${cust.brand}</td></tr>
    </g:each>
</table>
