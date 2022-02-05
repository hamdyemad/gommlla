<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laravel</title>
    <meta http-equiv="Content-Type" content="text/html;"/>
    <meta charset="UTF-8">
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;500&display=swap" rel="stylesheet">
	<style media="all">
        *{
            margin: 0;
            padding: 0;
            line-height: 1.3;
            font-family: 'Cairo', sans-serif;
            color: #333542;
        }
		body{
            @if($lang->rtl == 1)
            direction: rtl;
            @endif
			font-size: .875rem;
		}
		.gry-color *,
		.gry-color{
			color:#878f9c;
		}
		table{
			width: 100%;
		}
		table th{
			font-weight: normal;
		}
		table.padding th{
			padding: .5rem .7rem;
		}
		table.padding td{
			padding: .7rem;
		}
		table.sm-padding td{
			padding: .2rem .7rem;
		}
		.border-bottom td,
		.border-bottom th{
			border-bottom:1px solid #eceff4;
		}
		.text-left{
			text-align:left;
		}
		.text-right{
			text-align:right;
		}
		.small{
			font-size: .85rem;
		}
        .status {
            font-weight: bold;
            background: #8c8c8c;
            width: max-content;
            padding: 10px;
            border-radius: 10px;
            color: #fff;
        }
        .status span {
            color: #fff;
        }
	</style>
</head>
<body>
	<div>
		@php
			$logo = get_setting('header_logo');
		@endphp
		<div style="background: #eceff4;padding: 1.5rem;">
			<table>
				<tr>
					<td>
						@if($logo != null)
							<img loading="lazy"  src="{{ uploaded_asset($logo) }}" height="40" style="display:inline-block;">
						@else
							<img loading="lazy"  src="{{ static_asset('assets/img/logo.png') }}" height="40" style="display:inline-block;">
						@endif
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td style="font-size: 1.2rem;" class="strong">{{ get_setting('site_name') }}</td>
					<td class="text-right"></td>
				</tr>
				<tr>
					<td class="gry-color">{{ get_setting('contact_address') }}</td>
					<td class="text-right"></td>
				</tr>
				<tr>
					<td class="gry-color">{{  translate('Email') }}: {{ get_setting('contact_email') }}</td>
					<td class="text-right"><span class="gry-color">{{  translate('Order ID') }}:</span> <span class="strong">{{ $order->code }}</span></td>
				</tr>
				<tr>
					<td class="gry-color">{{  translate('Phone') }}: {{ get_setting('contact_phone') }}</td>
					<td class="text-right"><span class="gry-color">{{  translate('Order Date') }}:</span> <span class=" strong">{{ date('d-m-Y', $order->date) }}</span></td>
				</tr>
			</table>

		</div>

		<div style="padding: 1.5rem;padding-bottom: 0">
            <table>
				<tr>
                    <td class="strong gry-color">{{ translate('Bill to') }}: {{ $order->name }}</td>
                    <td>
                        <td>
                            <div class="status">
                                {{ translate('current order status') . ':' }}
                                <span>{{ $status }}</span>
                            </div>
                        </td>
                    </td>
                </tr>
				<tr><td class="gry-color">{{ $order->address }}, {{ $order->city->city }}, {{ $order->city->country->name }}</td></tr>
				<tr><td class="gry-color">{{ translate('Email') }}: {{ $order->email }}</td></tr>
				<tr><td class="gry-color">{{ translate('Phone') }}: {{ $order->phone }}</td></tr>
			</table>
		</div>
	</div>
</body>
</html>
