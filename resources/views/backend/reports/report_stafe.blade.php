@extends('backend.layouts.app')

@section('content')
    <div class="aiz-titlebar text-left mt-2 mb-3">
    	<div class=" align-items-center">
           <h1 class="h3">{{translate('Product wise stock report')}}</h1>
    	</div>
    </div>

    <div class="col-md-12 mx-auto">
        <div class="card">
            <!--card body-->
            <div class="card-body">
                <form action="{{ route('report_stafe') }}" method="GET">
                    <div class="form-group row offset-lg-2">
                        @if(auth()->user()['user_type']=='admin')
                        <div class="col-md-6 form-group">
                        <label class="col-form-label">الموظفين :</label>
                        
                            <select id="demo-ease" class="form-control aiz-selectpicker" name="employ_id">
                                @foreach ($staff as $key => $user)
                                    <option value="{{ $user->id }}">{{$user['name'] }}</option>
                                @endforeach
                            </select>
                        </div>
                        @endif
                        <div class="col-md-6form-group">
                        <label class=" col-form-label">{{translate('start time')}} :</label>
                        <input class="form-control" type="datetime-local" id="start_time" name="start_time"value="{{date('Y-m-d\TH:i:sP', strtotime($start_time))}}">
                        </div>
                         <div class="col-md-6 form-group">
                        <label class=" col-form-label">{{translate('end time')}} :</label>
                        <input class="form-control" type="datetime-local" id="end_time" name="end_time" value="{{date('Y-m-d\TH:i:sP', strtotime($end_time))}}">
                        </div>
                        <div class="cil-md-2">
                            <button class="btn btn-light" type="submit">{{ translate('Filter') }}</button>
                        </div>
                    </div>
                </form>
                <table class="table table-bordered aiz-table mb-0">
                    <thead>
                        <tr>
                            <th>{{ translate('اسم العملية') }}</th>
                             <th>{{ translate('مدين') }}</th>
                            <th>{{ translate('دائن') }}</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($array as $key => $row)
                            
                            <tr>
                                <td>
                                    @if($row['status']=='sall')
                                    مبيعات
                                    @else
                                    مردود مبيعات
                                    @endif
                                </td>
                                <td> @if($row['status']=='refund')
                                    {{$row['amount']}}
                                    @endif
                                    </td>
                                <td>
                                    @if($row['status']=='sall')
                                    {{$row['amount']}}
                                    @endif
                                    
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot><tr>
                        <td>totle</td>
                        <td id="sum_lass"></td>
                    <td id="sum_profit"></td>
                   
                    
                    
                    </tr></tfooter>
                    <tr>
                        <td>صافي الارباح</td>
                        <td></td>
                        <td id='profit'></td>
                    </tr>
                    <tr>
                        <td>خسائر </td>
                        <td></td>
                        <td id='loss'></td></tr>
                </table>
                <div class="aiz-pagination mt-4">
                    
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
 <script>
                            $(document).ready(function() {
                            
                            $('table thead th').each(function (i) {
                                if(i>0){
                calculateColumn(i);
                                }
            });
                            });

                            function calculateColumn(index) {

                                var total = 0;
                               $('.table tbody tr').each(function() {
                                  var value = parseInt($('td', this).eq(index).text());

                                    if (!isNaN(value)) {
                                     total += value;
                                 }
                               });

                                $('table tfoot td').eq(index).text( total);
                            }
                            total=0;
                            tota2=0;
                              totel1= $('.table tbody tr').each(function() {
                                  var value = parseInt($('td', this).eq(1).text());

                                    if (!isNaN(value)) {
                                     total += value;
                                 }
                               });
                                totel2= $('.table tbody tr').each(function() {
                                  var value = parseInt($('td', this).eq(2).text());

                                    if (!isNaN(value)) {
                                     tota2 += value;
                                 }
                               });
                          
                            if(tota2>total){
                                $('#profit').text(tota2-total)
                                
                            }else{
                              $('#loss').text(tota2-total) 
                            }
                            
                        </script>

@endsection


