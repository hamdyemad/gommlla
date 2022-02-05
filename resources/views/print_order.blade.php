
<!DOCTYPE html>
<html lang="{{ App::getLocale() }}" dir="">

<head>
    <title>Order</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <meta charset="UTF-8">
    {{--    <meta name="viewport" content="width=device-width, initial-scale=1">--}}
    {{--    <meta name="description" content="e-commerce site well design with responsive view." />--}}
    {{--    <meta http-equiv="X-UA-Compatible" content="IE=edge">--}}
    <link href="{{ asset('front/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet" media="screen" />
    {{--    <link href="{{ asset('front/css/stylesheet.css') }}" rel="stylesheet">--}}
    {{--    <link href="{{ asset('front/css/responsive.css') }}" rel="stylesheet">--}}

    {{--    <link href="{{ asset('front/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css" />--}}
    {{--    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">--}}
    {{--    <link href='https://fonts.googleapis.com/css?family=Cairo' rel='stylesheet'>--}}

    {{--    <link href="{{ asset('front/owl-carousel/owl.carousel.css') }}" type="text/css" rel="stylesheet" media="screen" />--}}
    {{--    <link href="{{ asset('front/owl-carousel/owl.transitions.css') }}" type="text/css" rel="stylesheet" media="screen" />--}}
    {{--    <script src="{{ asset('front/javascript/jquery-2.1.1.min.js') }}" type="text/javascript"></script>--}}
    <script src="{{ asset('front/bootstrap/js/bootstrap.min.js') }}" type="text/javascript"></script>
    {{--    <script src="{{ asset('front/javascript/jstree.min.js') }}" type="text/javascript"></script>--}}
    {{--    <script src="{{ asset('front/javascript/template.js') }}" type="text/javascript"></script>--}}
    {{--    <script src="{{ asset('front/javascript/common.js') }}" type="text/javascript"></script>--}}
    {{--    <script src="{{ asset('front/javascript/global.js') }}" type="text/javascript"></script>--}}

    {{--    <script src="{{ asset('front/owl-carousel/owl.carousel.min.js') }}" type="text/javascript"></script>--}}
    {{--    <script src="{{ asset('plugins/nicescroll/jquery.nicescroll.min.js') }}" type="text/javascript"></script>--}}
    {{--    <!-- Toaster -->--}}
    {{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />--}}

    {{--    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>--}}
    {{--    @if(App::getLocale() == 'ar')--}}
    <link rel="stylesheet" href="{{ asset('bootstrap/css/bootstrap-rtl.min.css') }}">
    {{--        <link rel="stylesheet" href="{{ asset('front/css/style_ar.css') }}">--}}
    {{--     @endif--}}

    <meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>

    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <meta http-equiv='X-UA-Compatible' content='ie=edge'>

    <style>


    </style>

</head>

<body>
<div style="min-height: 72vh">
    <div class="row" style="padding: 3px;height: 100px">
        @for($i=0;$i<10;$i++)
        <div class="col-md-4" style=" float: left;width: 32%;margin:10px  ;height: 100px">
            @php

echo DNS1D::getBarcodeSVG($row['barcode'], 'C39');
            @endphp
        </div>
@endfor
</div>




<canvas id="canvas" ></canvas>
<script src="{{ asset('front/javascript/parally.js') }}"></script>
<!-- Toaster -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>





</body>

</html>





<script src="{{ asset('front/javascript/parally.js') }}"></script>
<!-- Toaster -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script src="  https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="  https://unpkg.com/html2canvas@1.0.0-rc.5/dist/html2canvas.js"></script>
<script>
    window.onload = function() { window.print(); }

    window.onafterprint(function (){
        window.close()
    })


</script>



</body>

</html>
