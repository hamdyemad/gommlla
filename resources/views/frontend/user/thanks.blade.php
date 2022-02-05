@extends('frontend.layouts.app')
@section('content')
    <div class="thanks pt-3">
        <div class="container">
            <a class="btn btn-primary mb-2" href="{{route('dashboard')}}">
                <i class="fas fa-arrow-circle-left" style="margin-inline-end: 5px"></i>
                <span>{{ translate('Go To Dashboard') }}</span>
            </a>
            <div class="alert alert-success text-center">
                <h2>{{ translate('congratulations') }} !</h2>
                @if(Auth::user()->user_type !== 'customer')
                    <p>{{ translate('your account has been created but you need to wait for verifing your account from admin') }}</p>
                @else
                    <p>{{ translate('your account has been created') }}</p>
                @endif
                </div>
            <div class="alert alert-primary text-center">{{ translate('there is a tutorial video that you can watch to know how gommlla work !') }}</div>
            <iframe class="w-100" height="500px"
            src="{{ $video }}"
            title="YouTube video player" frameborder="0"
            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
    </div>
@endsection
