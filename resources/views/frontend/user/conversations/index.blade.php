@extends('frontend.layouts.app')

@section('content')
<section class="py-5">
    <div class="container">
        <div class="d-flex align-items-start">
              @include('frontend.inc.user_side_nav')
              <div class="aiz-user-panel">
                  <div class="aiz-titlebar mt-2 mb-4">
                      <div class="row align-items-center">
                          <div class="col-md-6">
                              <b class="h4">{{ translate('Conversations')}}</b>
                          </div>
                      </div>
                  </div>

                  <div class="card no-border mt-4 p-3">
                      @if(count($conversations) > 0)
                        @foreach ($conversations as $key => $conversation)
                            <div class="block block-comment">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <div class="media align-items-center">
                                            <span class="avatar avatar-sm mr-3 flex-shrink-0">
                                                <img @if ($conversation->receiver->avatar_original == null) src="{{ static_asset('assets/img/avatar-place.png') }}" @else src="{{ uploaded_asset($conversation->receiver->avatar_original) }}" @endif class="rounded-circle">
                                            </span>
                                            <span>{{ $conversation->receiver->name }}</span>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="block-body">
                                            <div class="block-body-inner d-flex align-items-center">
                                                <a href="{{ route('conversations.show', encrypt($conversation->id)) }}">
                                                    @if(count($conversation->messages) > 0)
                                                    {{ $conversation->messages->last()->message }}
                                                    @if (($conversation->messages->last()->viewed == 0) && $conversation->messages->last()->user->id !== Auth::user()->id)
                                                        <span class="badge badge-inline badge-danger badge-new-message">{{ translate('New') }}</span>
                                                    @endif
                                                    @else
                                                        {{ translate('chat') }}
                                                    @endif
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        @if(count($conversation->messages) > 0)
                                            <span class="comment-date">
                                                {{ date('h:i:m d-m-Y', strtotime($conversation->messages->last()->created_at)) }}
                                            </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        @else
                        <form action="{{ route('conversations.store') }}" method="POST">
                            @csrf
                            <button class="btn btn-block btn-primary">{{ translate('talk with admin') }}</button>
                        </form>
                      @endif
                  </div>
                  <div class="aiz-pagination">
                      	{{ $conversations->links() }}
                	</div>
              </div>
        </div>
    </div>
</section>

@endsection
