var Base64Tool = function() {
	var b64Table = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
	//加密
	this.encrypt = function(key, val) {
		var data = []
		val.split("").forEach(function(v, i) {
			data.push(v.charCodeAt(0) ^ key.charCodeAt(Math.floor(i % key.length)))
		})
		var o1, o2, o3, h1, h2, h3, h4, bits, r, i = 0,
			enc = '';
		do {
			o1 = data[i++];
			o2 = data[i++];
			o3 = data[i++];
			bits = o1 << 16 | o2 << 8 | o3;
			h1 = bits >> 18 & 0x3f;
			h2 = bits >> 12 & 0x3f;
			h3 = bits >> 6 & 0x3f;
			h4 = bits & 0x3f;
			enc += b64Table.charAt(h1) + b64Table.charAt(h2) + b64Table.charAt(h3) + b64Table.charAt(h4);
		} while (i < data.length);
		r = data.length % 3;
		return (r ? enc.slice(0, r - 3) : enc) + '==='.slice(r || 3);
	}
	this.decrypt = function(key, data) {
		var o1, o2, o3, h1, h2, h3, h4, bits, i = 0,
			result = []
		data += ''
		do {
			h1 = b64Table.indexOf(data.charAt(i++));
			h2 = b64Table.indexOf(data.charAt(i++));
			h3 = b64Table.indexOf(data.charAt(i++));
			h4 = b64Table.indexOf(data.charAt(i++));
			bits = h1 << 18 | h2 << 12 | h3 << 6 | h4;
			o1 = bits >> 16 & 0xff;
			o2 = bits >> 8 & 0xff;
			o3 = bits & 0xff;
			result.push(o1);
			if (h3 !== 64) {
				result.push(o2);
				if (h4 !== 64) {
					result.push(o3);
				}
			}
		} while (i < data.length)
		var cbox = []
		result.forEach(function(c, i) {
			cbox.push(String.fromCharCode(c ^ key.charCodeAt(Math.floor(i % key.length))))
		})
		return cbox.join("")
	}
}
