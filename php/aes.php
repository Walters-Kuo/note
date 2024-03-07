<?php
/*
$plaintext = "walters@gmail.com";
$key = "5a04ec902686fb05a6b7a338b6e07760";
$ivlen = openssl_cipher_iv_length($cipher);
$iv = openssl_random_pseudo_bytes($ivlen);
$ciphertext_raw = openssl_encrypt($plaintext, $cipher, $key, $options=0, $iv);
echo $ciphertext_raw."\n";
$ciphertext = base64_encode($iv.$ciphertext_raw);
echo $ciphertext."\n";

$ciphertext_raw = base64_decode($ciphertext);
$ivlen = openssl_cipher_iv_length($cipher);
$iv = substr($ciphertext_raw, 0, $ivlen);
$ciphertext = str_replace($iv, '', $ciphertext_raw);
echo $ciphertext."\n";
$original_plaintext = openssl_decrypt($ciphertext, $cipher, $key, $options=0, $iv);
echo $original_plaintext."\n";
*/

$cipher="aes-128-cbc";
$plaintext = "walters@gmail.com";
$key = "5a04ec902686fb05a6b7a338b6e07760";

$ciphertext = "NqW3QNKsomJShKhmE8Vig9+oKWKnMMrVca0E3Ty7lN6+atLwuLyamYd880TsBrq+";
$ciphertext_raw = substr(bin2hex(base64_decode($ciphertext)), 0, -4);
echo "ciphertext_raw=".$ciphertext_raw."\n";

$ivlen = openssl_cipher_iv_length($cipher);
$iv = substr($ciphertext_raw, 0, 32);
echo "iv=".$iv."\n";
$ciphertext = substr($ciphertext_raw, 32);
echo "ciphertext=".$ciphertext."\n";

$original_plaintext = openssl_decrypt($ciphertext, $cipher, $key, $options=0, $iv);
echo '$original_plaintext='.$original_plaintext."\n";

feat(controller): one-click unsubscribe

edm.php
use App\Repositories\MemberDataRepository;

private $edm_type = 16;

private function respond_json($data)
    {
        return json_encode($data);
    }

    public function unsubscribe(Request $request, EdmService $service, MemberDataRepository $memberData)
    {
        if (!isset($request->e) or !isset($request->s)) {
            return $this->respond_json(['status'=>false, 'code'=>401]);     
        }

        $key = config('app.key');
        $email = $request->e;
        $ciphertext = $request->s;
  
        $md5_text = md5($email."+".$this->edm_type."+".$key);
        if ($md5_text == $ciphertext) 
        {
            //get member account and check is subscribe
            $re = $memberData->getSubscribeByEmail($email);
         
            if(!$re){
                return $this->respond_json(['status'=>false, 'code'=>402]);
            }

            $para = new \stdClass();
            $para->checkMemberId = $re[0]->id;
            $respond = $service->cancelByMoney($para, $this->edm_type);
            
            if($respond['status'] === true && $respond['code'] === 202) {
                $service->cancelByCas($para, $this->edm_type);
                return $this->respond_json(['status'=>true, 'code'=>200]);
            }
        } else {
            return $this->respond_json(['status'=>false, 'code'=>403]);
        }
    }



MemberDataRepository.php


use Illuminate\Support\Facades\DB;
private $subscribed = 1;
private $unsubscribe = 2;
private $cas_edm_type = 16;


    public function getSubscribeByEmail($email)
    {
        return DB::table('MEMBER_DATA', 'member')
            ->select('member.ACCOUNT AS id')
            ->leftJoin('EDM_SUBSCRIBE AS edm', 'member.ACCOUNT', '=', 'edm.ACCOUNT')
            ->where('member.EMAIL', '=', $email)
            ->where('edm.IS_CANCEL', '=', $this->subscribed)
            ->where('edm.EDM_TYPE', '=', $this->cas_edm_type)
            ->get()->toArray();
    }