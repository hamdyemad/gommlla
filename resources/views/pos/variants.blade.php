<div class="modal-header bord-btm">
    <h4 class="modal-title h6">{{ translate('Select variation') }} - {{ $stocks->first()->product->getTranslation('name') }}</h4>
    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
</div>
<div class="modal-body">
    <div class="row gutters-5">
        @foreach ($stocks as $key => $stock)
            <div class="col-lg-3 col-sm-6">
                <label class="aiz-megabox d-block">
                    <input type="radio" name="variant" value="{{ $stock->variant }}" @if ($stock->qty <= 0)
                        disabled
                    @endif>
                    <span class="d-flex p-2 pad-all aiz-megabox-elem">
                        <span class="aiz-rounded-check flex-shrink-0 @if ($stock->qty > 0)
                            mt-1
                        @endif"></span>
                        <?php
                        $count_color=count(json_decode($stock['product']['colors']));
                        $attripute=json_decode($stock['product']['attributes']);

                        $pieces = explode("-", $stock->variant);
                        $color='';
                        if($count_color>0){
                            $color=\App\Color::where('name',$pieces[0])->first();
                            $color=$color['code'];
                        }
                        $attr=[];
                        if(count($attripute)>0&&$count_color>0){
                            for($i=1;$i<=count($attripute);$i++){
                                $attr_val=\App\Attribute::where('id',$attripute[$i-1])->first();
$attr[]=['name'=>$attr_val['name'],
    'value'=>$pieces[$i]
];
                            }

                        }
                        elseif (count($attripute)>0&&$count_color==0){
                            for($i=0;$i<count($attripute);$i++){
                                $attr_val=\App\Attribute::where('id',$attripute[$i])->first();
                                $attr[]=['name'=>$attr_val['name'],
                                    'value'=>$pieces[$i]
                                ];
                            }
                        }

                        ?>

                        <span class="flex-grow-1 pad-lft pl-2">
                            <span class="d-block strong-600">@if(!empty($color))   <span style="width: 20px;height: 20px;display: inline-block;;background: {{$color}}"></span> : color
                              @endif
                           <br>
                            @foreach($attr as $attr_show )


                                    {{$attr_show['name']}}:{{$attr_show['value']}}
                                    <br>


                                @endforeach
                            </span>
                            <span class="d-block">Price: {{ single_price($stock->price) }}</span>
                            <span class="badge badge-inline @if ($stock->qty <= 0)
                                badge-secondary
                            @else
                                badge-success
                            @endif">Stock: {{ $stock->qty }}</span>
                        </span>
                    </span>
                </label>
            </div>
        @endforeach
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-styled btn-base-3" data-dismiss="modal">Close</button>
    <button type="button" onclick="addVariantProductToCart({{ $stocks->first()->product->id }})" class="btn btn-primary btn-styled btn-base-1">Add Product</button>
</div>
