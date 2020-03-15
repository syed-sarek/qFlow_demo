<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Daily Sales Invoice</title>
    
    <style>
    .invoice-box {
        max-width: 800px;
        margin: auto;
        padding: 30px;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0, 0, 0, .15);
        font-size: 16px;
        line-height: 24px;
        font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
        color: #555;
    }
    
    .invoice-box table {
        width: 100%;
        line-height: inherit;
        text-align: left;
    }
    
    .invoice-box table td {
        padding: 5px;
        vertical-align: top;
    }
    
    .invoice-box table tr td:nth-child(3) {
        text-align: right;
    }
    
    .invoice-box table tr.top table td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.top table td.title {
        font-size: 45px;
        line-height: 45px;
        color: #333;
    }
    
    .invoice-box table tr.information table td {
        padding-bottom: 40px;
    }
    
    .invoice-box table tr.heading td {
        background: #eee;
        border-bottom: 1px solid #ddd;
        font-weight: bold;
    }
    
    .invoice-box table tr.details td {
        padding-bottom: 20px;
    }
    
    .invoice-box table tr.item td{
        border-bottom: 1px solid #eee;
    }
    
    .invoice-box table tr.item.last td {
        border-bottom: none;
    }
    
    .invoice-box table tr.total td:nth-child(2) {
        border-top: 2px solid #eee;
        font-weight: bold;
    }
    
    @media only screen and (max-width: 600px) {
        .invoice-box table tr.top table td {
            width: 100%;
            display: block;
            text-align: center;
        }
        
        .invoice-box table tr.information table td {
            width: 100%;
            display: block;
            text-align: center;
        }
    }
    
    /** RTL **/
    .rtl {
        direction: rtl;
        font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
    }
    
    .rtl table {
        text-align: right;
    }
    
    .rtl table tr td:nth-child(3) {
        text-align: left;
    }
    </style>
	<script>
	window.print();
	</script>
	<script>
		.split(/[\n,]+/)
	</script>
</head>

<body>
    <div class="invoice-box">
	<g:each in="${com_info}" var="p" status="i">
		<h2 style="text-align: center; padding: 0 0 10px 0;margin: 0;"><asset:image src="company.jpg" style="margin: 0 0 -10px 0;width:40px; height:40px ; max-width:300px;"/> ${p.name}</h2>
		<h4 style="text-align: center; padding: 0;margin: 0;">${p.address}</h4>
		<h4 style="text-align: center; padding: 0;margin: 0;">Phone: ${p.phone}, ${p.mobile} | Email: ${p.email}</h4>
	</g:each><br><br>
	<g:each in="${item_list}" var="p" status="i">
        <table cellpadding="0" cellspacing="0">
            <tr class="information">
                <td colspan="3">
                    <table>
                        <tr>
                            <td>
                                Invoice #: ${p.trn_no}<br>
                                Date: <g:formatDate date="${p.date}" type="date" style="LONG"/>
                            </td>
							<td>
							</td>
							
                            <td>
                                ${drl2.Customer.executeQuery("select name from Customer where id='${p.customer_id}'").join(",")}<br>
                                ${drl2.Customer.executeQuery("select phone from Customer where id='${p.customer_id}'").join(",")}<br>
                                ${drl2.Customer.executeQuery("select address from Customer where id='${p.customer_id}'").join(",")}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="heading">
                <td>
                    Item
                </td>
				
				<td>
                    Quantity
                </td>
                
                <td>
                    Price
                </td>
            </tr>
			
            <tr class="item">
                <td>
                    ${p.item_name}
                </td>
				
				<td>
                    ${p.quantity}
                </td>
                
                <td>
                    ${p.price}
                </td>
            </tr>
			
            
            <tr class="total">
                <td>
				
				</td>
				<td>
				
				</td>
                
                <td>
                   Total: ${p.price}
                </td>
            </tr>
        </table>
		</g:each>
    </div>
</body>
</html>
