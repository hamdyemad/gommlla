<a href="{{ route('compare') }}" class="d-flex align-items-center text-reset">
    <i class="la la-refresh la-2x opacity-80"></i>
    <span class="flex-grow-1 ml-1">
        @if(Session::has('compare'))
            <span>{{ count(Session::get('compare'))}}</span>
        @else
            <span>0</span>
        @endif
        {{-- <span class="nav-box-text d-none d-xl-block opacity-70">{{translate('Compare')}}</span> --}}
    </span>
</a>
