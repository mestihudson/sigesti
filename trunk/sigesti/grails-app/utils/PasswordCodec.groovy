import java.security.MessageDigest
import sun.misc.BASE64Encoder

class PasswordCodec {
	static encode = {
		str->
		MessageDigest digest = MessageDigest.getInstance("SHA-512")
		digest.update(str.getBytes("UTF-8"))
		return new BASE64Encoder().encode(digest.digest())
	}
}
