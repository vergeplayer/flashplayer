package com.youku.utils {
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    public class StringUtil {
        
        /**
         *
         * @param    char
         * @param    replace
         * @param    replaceWith
         * @return
         */
        public static function replace(pstr:String, str1:String, str2:String):String {
            return pstr.split(str1).join(str2);
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @return
         */
        public static function leftTrim(str:String):String {
            for (var i:uint = 0; i < str.length; i++) {
                if (str.substr(i, 1) != " ") {
                    return str.substr(i);
                } else {
                    if (i == str.length - 1) {
                        return "";
                    }
                }
            }
            return str;
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @return
         */
        public static function rightTrim(str:String):String {
            for (var i:uint = str.length - 1; i >= 0; i--) {
                if (str.substr(i, 1) != " ") {
                    return str.substr(0, i + 1);
                } else {
                    if (i == 0) {
                        return "";
                    }
                }
            }
            return str;
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @return
         */
        public static function trim(str:String):String {
            var result_str:String = str;
            result_str = leftTrim(result_str);
            result_str = rightTrim(result_str);
            return result_str;
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @return
         */
        public static function trimAll(str:String):String {
            return str.split(" ").join("");
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @return
         */
        public static function trimXML(str:String):String {
            var resultStr:String = "";
            var array:Array = str.split(">");
            for (var i:uint = 0; i < array.length - 1; i++) {
                array[i] = trim(array[i] + ">");
                resultStr += array[i];
            }
            return resultStr;
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @param   num
         * @return
         */
        public static function leftStr(str:String, num:int):String {
            if (str.length > num) {
                str = str.substring(0, num);
            }
            return str;
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @param   num
         * @return
         */
        public static function rightStr(str:String, num:int):String {
            if (str.length > num) {
                str = str.substr(-num);
            }
            return str;
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   pstr
         * @param   str
         * @param   where
         * @return
         */
        public static function insertStr(pstr:String, str:String, ind:int):String {
            var leftPart:String = leftStr(pstr, ind);
            var rightPart:String = rightStr(pstr, (pstr.length - ind));
            var finalStr:String = leftPart + str + rightPart;
            return finalStr;
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @return
         */
        public static function subfix(str:String):String {
            str = trim(str.toLowerCase());
            str = str.substring(str.lastIndexOf(".") + 1, str.length);
            return str;
        }
        
        /**
         * Enter description here
         *
         * @usage
         * @param   str
         * @return
         */
        public static function isEmail(str:String):Boolean {
            if (str == null) {
                return false;
            }
            str = trim(str);
            var p:RegExp = /(\w|[_.\-])+@((\w|-)+\.)+\w{2,4}+/;
            if (p.exec(str) == null) {
                return false;
            }
            return true;
        }
        
        /**
         *
         * @return
         */
        public static function getGUID():String {
            var uid:String = "";
            var baseChars:String = "0123456789abcdef";
            var i:int;
            var j:int;
            for (i = 0; i < 8; i++) { //先成成前8位
                uid += baseChars.charAt(Math.round(Math.random() * 15));
            }
            for (i = 0; i < 3; i++) { //中间的三个4位16进制数
                uid += "-";
                for (j = 0; j < 4; j++) {
                    uid += baseChars.charAt(Math.round(Math.random() * 15));
                }
            }
            uid += "-";
            var time:Number = new Date().getTime();
            uid += ("0000000" + time.toString(16).toUpperCase()).substr(-8); //取后边8位
            for (i = 0; i < 4; i++) {
                uid += baseChars.charAt(Math.round(Math.random() * 15)); //再循环4次随机拿出4位
            }
            return uid;
        }
        
        // Joins the path to the base URL minding the preceding slash if it
        // exists on either side of the join.   This ensures that URLs like
        //   http://base//path
        // don't get generated.
        public static function URLJoin(base:String, path:String):String {
            var post:Boolean = base.lastIndexOf('/') == base.length - 1;
            var pre:Boolean = path.indexOf('/') == 0;
            if (pre && post)
                return base + path.substr(1);
            else if (pre || post)
                return base + path;
            else
                return [base, path].join('/');
        }
        
        
        //指定千分位分隔符
        /**
         * @param number
         * @return String
         */
        public static function commaWithNumber(number:uint):String {
            var string:String = String(number);
            var tmpArray_a:Array = string.split("");
            var tmpArray_b:Array = [];
            tmpArray_a.reverse();
            for (var i:int = 0; i < string.length; i++) {
                if (i != 0) {
                    if (i % 3 == 0) {
                        tmpArray_b.push(",");
                    }
                }
                
                tmpArray_b.push(tmpArray_a[i]);
            }
            tmpArray_b.reverse();
            
            return tmpArray_b.join("");
        }
        
        public static function getDomain(url:String):String {
            var domain:String = "";
            var pattern:RegExp = /^(?:(\w+):\/\/)?(?:(\w+):?(\w+)?@)?([^:\/\?#]+)(?::(\d+))?(\/[^\?#]+)?(?:\?([^#]+))?(?:#(\w+))?/;
            
            try {
                domain = url.match(pattern)[4];
            } catch (e:Error) {
                domain = "";
            }
            
            if (!domain) {
                domain = "";
            }
            
            return domain;
        }
        
        public static function isDomainMatch(str:String, domain:String):Boolean {
            if (str == null || domain == null) {
                return false;
            }
            
            var strlen:int = str.length;
            var domainlen:int = domain.length;
            
            for (var i:int = 1; i <= domain.length; i++) {
                if (strlen - i < 0 ||
                    domain.charAt(domainlen - i) != str.charAt(strlen - i)) {
                    
                    return false;
                }
            }
            return true;
        }
        
        //判断链接的合法性
        public static function isDomianLegal(str:String):Boolean {
            var domain:String = getDomain(str);
            
            if (domain == null || domain == "") {
                return false;
            }
            
            return isDomainMatch(domain, ".aixiu.com") ||
                isDomainMatch(domain, ".tudou.com") ||
                isDomainMatch(domain, ".ykimg.com");
        }
        
        //从开始位置截取字符串中指定宽度的字符串
        public static function getLimitWidthStr(str:String, maxWidth:Number, textFormat:TextFormat):String {
            var tf:TextField = new TextField();
            tf.defaultTextFormat = textFormat;
            tf.text = str;
            if (tf.textWidth <= maxWidth) {
                return str;
            }
            
            var length:Number = 1;
            
            while (length <= str.length) {
                tf.text = str.substr(0, length);
                if (tf.textWidth > maxWidth) {
                    length--;
                    break;
                }
                length++;
            }
            
            //如果length比str.length小，说明文本的宽度已经超过了规定的宽度
            //如果length与str.length相同，或者比str.length大，说明文本的宽度没有超过规定的宽度
            if (length < str.length) {
                str = str.substr(0, length);
                str += "...";
            }
            
            return str;
        }
    }

}
