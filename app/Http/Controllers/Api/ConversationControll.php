<?php
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Conversation;
use App\BusinessSetting;
use App\Message;
use Auth;
use App\Product;
use Mail;
use App\User;
use App\Mail\ConversationMailManager;

class ConversationControll extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (BusinessSetting::where('type', 'conversation_system')->first()->value == 1) {
            $conversations = Conversation::where('sender_id', $request['user_id'])->orWhere('receiver_id', $request['user_id'])->orderBy('created_at', 'desc')->get();
            
             foreach ($conversations as $key => $conversation){
               if ($request['user_id'] == $conversation->sender_id){
               if ($conversation->receiver->avatar_original == null) {
                                            $conversation['img'] = static_asset('assets/img/avatar-place.png');
                                                        
                                                    }
                    else{
                      $conversation['img']=uploaded_asset($conversation->receiver->avatar_original)  ;  
                                            }  
               }
               else{
                   if ($conversation->sender->avatar_original == null){
            $conversation['img']=static_asset('assets/img/avatar-place.png')  ;  
                }
                else{
                    $conversation['img']= uploaded_asset($conversation->sender->avatar_original); 
                                                  }
               }
                                                     
                  if ($request['user_id'] == $conversation->sender_id){
                      $conversation['name']=    $conversation->receiver->name;
                  }else{
                      $conversation['name']=    $conversation->sender->name; 
                  }
                                                 
             $conversation['comment-date']= date('h:i:m d-m-Y', strtotime($conversation->messages->last()->created_at));
                                           
        }
            $data['data']=$conversations;
            $data['success'] = true;
           $data[ 'status'] = 200;
            return $data;
            
        }
        else {
            flash(translate('Conversation is disabled at this moment'))->warning();
            return back();
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function admin_index()
    {
        if (BusinessSetting::where('type', 'conversation_system')->first()->value == 1) {
            $conversations = Conversation::orderBy('created_at', 'desc')->get();
            return view('backend.support.conversations.index', compact('conversations'));
        }
        else {
            flash(translate('Conversation is disabled at this moment'))->warning();
            return back();
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $user_type = Product::findOrFail($request->product_id)->user->user_type;
$user=User::findOrFail($request->user_id);
        $conversation = new Conversation;
        $conversation->sender_id = $request->user_id;
        $conversation->receiver_id = Product::findOrFail($request->product_id)->user->id;
        $conversation->title = $request->title;

        if($conversation->save()) {
            $message = new Message;
            $message->conversation_id = $conversation->id;
            $message->user_id = $request->user_id;
            $message->message = $request->message;

            if ($message->save()) {
                $this->send_message_to_seller($conversation, $message, $user_type,$user);
            }
        }

       $data['data']= 'Message has been send to seller';
       $data['success'] = true;
           $data[ 'status'] = 200;
        return $data;
    }

    public function send_message_to_seller($conversation, $message, $user_type,$user)
    {
        $array['view'] = 'emails.conversation';
        $array['subject'] = 'Sender:- '.$user['name'];
        $array['from'] = env('MAIL_USERNAME');
        $array['content'] = 'Hi! You recieved a message from '.$user['name'].'.';
        $array['sender'] = $user['name'];

        if($user_type == 'admin') {
            $array['link'] = route('conversations.admin_show', encrypt($conversation->id));
        } else {
            $array['link'] = route('conversations.show', encrypt($conversation->id));
        }

        $array['details'] = $message->message;

        try {
            Mail::to($conversation->receiver->email)->queue(new ConversationMailManager($array));
        } catch (\Exception $e) {
            dd($e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id ,Request $request)
    {
        $conversation = Conversation::findOrFail($id);
        if ($conversation->sender_id == $request['user_id']) {
            $conversation->sender_viewed = 1;
        }
        elseif($conversation->receiver_id == $request['user_id']) {
            $conversation->receiver_viewed = 1;
        }
        $conversation->save();
        
       foreach($conversation->messages as $message){
        if ($request['user_id'] == $conversation->sender_id){
            if ($conversation->receiver->avatar_original == null) {
            
            
           $message['img']= static_asset('assets/img/avatar-place.png') ;
           }else {
           $message['img']= uploaded_asset($conversation->receiver->avatar_original);
            
        }
        
    }  else{
        if ($conversation->sender->avatar_original == null){
             $message['img']= static_asset('assets/img/avatar-place.png') ;
        } else{
           $message['img']= uploaded_asset($conversation->sender->avatar_original); 
        } 
          }                       
                if ($message->user != null){
                  $message['name']=  $message->user->name;
                }
                                           
    }
      $data['title']=$conversation['title']  ; 
      $data['conversation_id']=$conversation['id'];
      $data['message']=$conversation['messages'];
       $data['success'] = true;
           $data[ 'status'] = 200;
        return $data;
        
        
    }
    public function store_message(Request $request){
        $message = new Message;
        $message->conversation_id = $request->conversation_id;
        $message->user_id = $request['user_id'];
        $message->message = $request->message;
        $message->save();
        $conversation = $message->conversation;
        if ($conversation->sender_id ==$request['user_id']) {
            $conversation->receiver_viewed ="1";
        }
        elseif($conversation->receiver_id == $request['user_id']) {
            $conversation->sender_viewed ="1";
        }
        $conversation->save();
         $data['data']='Message has been send to seller';
       $data['success'] = true;
           $data[ 'status'] = 200;
        return $data;
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function refresh(Request $request)
    {
        $conversation = Conversation::findOrFail(decrypt($request->id));
        if($conversation->sender_id == Auth::user()->id){
            $conversation->sender_viewed = 1;
            $conversation->save();
        }
        else{
            $conversation->receiver_viewed = 1;
            $conversation->save();
        }
        return view('frontend.partials.messages', compact('conversation'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function admin_show($id)
    {
        $conversation = Conversation::findOrFail(decrypt($id));
        if ($conversation->sender_id == Auth::user()->id) {
            $conversation->sender_viewed = 1;
        }
        elseif($conversation->receiver_id == Auth::user()->id) {
            $conversation->receiver_viewed = 1;
        }
        $conversation->save();
        return view('backend.support.conversations.show', compact('conversation'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $conversation = Conversation::findOrFail(decrypt($id));
        foreach ($conversation->messages as $key => $message) {
            $message->delete();
        }
        if(Conversation::destroy(decrypt($id))){
            flash(translate('Conversation has been deleted successfully'))->success();
            return back();
        }
    }
}